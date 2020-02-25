module Types::Users
  class UsersType < Types::BaseObjectList
    field :rows, [Types::Users::UserType], null: false
  end
end
