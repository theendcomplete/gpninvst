module Mutations::Users
  class CreateUserMutation < Mutations::BaseMutation
    type Types::Users::UserType

    argument :login, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: false
    argument :role_code, String, required: true
    argument :status_code, String, required: false
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :archived_at, Scalars::DateTime, required: false

    def resolve(args)
      authorize_user [UserRole::Admin]
      User.create!(args)
    end
  end
end
