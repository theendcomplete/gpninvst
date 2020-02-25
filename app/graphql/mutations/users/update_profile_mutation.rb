module Mutations::Users
  class UpdateProfileMutation < Mutations::BaseMutation
    type Types::Users::UserType

    argument :password, String, required: false
    argument :password_old, String, required: false
    argument :password_confirmation, String, required: false
    argument :first_name, String, required: false
    argument :last_name, String, required: false

    def resolve(args)
      authorize_user
      if args[:password].present?
        raise Error::BadRequest, code: 'USER_PROFILE_PASSWORD_CHANGE_NOT_ALLOWED' unless context[:user].password_change_allowed?
        raise Error::BadRequest, code: 'USER_PROFILE_OLD_PASSWORD_INVALID' unless context[:user].authenticate(args[:password_old])
        raise Error::BadRequest, code: 'USER_PROFILE_NEW_PASSWORD_INVALID' if args[:password] == args[:password_old]
      end
      context[:user].update!(args)
      context[:user]
    end
  end
end
