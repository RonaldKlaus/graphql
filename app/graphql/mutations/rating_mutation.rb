Types::RatingMutation = GraphQL::ObjectMutation.define do
  name "createRating"
  description "create a rating"

  field :id, !types.Int
  field :value, !types.Int
  field :top, !types.Boolean
  field :flop, !types.Boolean
  field :user, !Types::UserType
  field :movie, !Types::MovieType
end
