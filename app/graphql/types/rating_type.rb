Types::RatingType = GraphQL::ObjectType.define do
  name "Rating"
  description "a rating"

  field :id, !types.Int
  field :value, !types.Int
  field :top, !types.Boolean
  field :flop, !types.Boolean
  field :user, !Types::UserType
  field :movie, !Types::MovieType
end
