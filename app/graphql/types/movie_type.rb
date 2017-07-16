Types::MovieType = GraphQL::ObjectType.define do
  name "Movie"
  description "a movie"

  field :id, !types.Int
  field :title, !types.String

  # that is realy cool
  field :ratings, types[Types::RatingType]
  field :user, Types::UserType
end
