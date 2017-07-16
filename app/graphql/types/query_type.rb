Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(root, args, context) {
      "Hello World!"
    }
  end

  field :movie, Types::MovieType do
    description "a movie"
    # search for specific movie
    argument :title, types.String

    resolve ->(root, args, context) {
      Movie.find_by(title: args[:title])
    }
  end

  field :movies, types[Types::MovieType] do
    description "a list of movies"
    resolve ->(root, args, context) {
      Movie.limit(10)
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
      User.limit(10)
    }
  end
end
