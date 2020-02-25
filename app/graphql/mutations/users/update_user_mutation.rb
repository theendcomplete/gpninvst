module Mutations::Users
  class UpdateUserMutation < Mutations::BaseMutation
    type Types::Users::UserType

    argument :id, ID, required: true
    argument :login, String, required: false
    argument :email, String, required: false
    argument :password, String, required: false
    argument :password_confirmation, String, required: false
    argument :role_code, String, required: false
    argument :status_code, String, required: false
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :archived_at, Scalars::DateTime, required: false

    def resolve(args)
      authorize_user [UserRole::Admin]
      user = User.accessible(context[:user]).find(args[:id])
      user.update!(args)
      user
    end
  end
end
