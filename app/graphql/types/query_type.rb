require 'graphql/query_resolver'

Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :movie, Types::MovieType do
    description "a movie"
    # search for specific movie
    argument :title, types.String

    resolve ->(root, args, context) {
      GraphQL::QueryResolver.run(Movie, context, Types::MovieType) do
        Movie.find_by(title: args[:title])
      end
    }
  end

  field :movies, types[Types::MovieType] do
    description "a list of movies"
    resolve ->(root, args, context) {
      Movie.all
    }
  end

  field :movies_with_loader, types[Types::MovieType] do
    description "a list of movies"
    resolve ->(root, args, context) {
      GraphQL::QueryResolver.run(Movie, context, Types::MovieType) do
        Movie.all
      end
    }
  end

  field :user, Types::UserType do
    description "a user"
    #search for a specific user
    argument :username, types.String
    resolve ->(root, args, context) {
      User.first
    }
  end

  field :users, types[Types::UserType] do
    description "a list of users"
    resolve ->(root, args, context) {
      User.all
    }
  end
end
