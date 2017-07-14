Types::MovieType = GraphQL::ObjectType.define do
  name "Movie"
  description "a movie"

  field :id, !types.Int
  field :title, !types.String

  field :ratings, types[Types::RatingType]
  # that is realy cool
  field :user, Types::UserType
end
