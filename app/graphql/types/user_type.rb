Types::UserType = GraphQL::ObjectType.define do
  name "User"
  description "a user"

  field :id, !types.Int
  field :username, !types.String
  field :ratings, types[Types::RatingType]
  field :movies, types[Types::MovieType]
  field :name, !types.String do
    resolve ->(user, args, ctx) {
      [
        [user.first_name, user.last_name].compact.join(" "),
        user.username
      ].compact.join(" - ")
    }
  end
end
