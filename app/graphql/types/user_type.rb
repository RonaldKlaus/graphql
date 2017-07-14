Types::UserType = GraphQL::ObjectType.define do
  name "User"
  description "a user"

  field :id, !types.Int
  field :username, !types.String
  field :name, !types.String do
    resolve ->(user, args, ctx) {
      [
        [user.firstname, user.lastname].compact.join(" "),
        user.username
      ].compact.join(" - ")
    }
  end
end
