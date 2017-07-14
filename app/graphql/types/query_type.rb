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
    resolve ->(root, args, context) {
      Rails.logger.debug "---- #{args}, #{context}"
      Movie.find_by(permalink: args[:permalink])
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
