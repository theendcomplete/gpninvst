module Mutations::Users
  class DestroyUserMutation < Mutations::BaseMutation
    type Boolean

    argument :id, ID, required: true
    argument :confirmation_email, String, required: true

    def resolve(id:, confirmation_email:)
      authorize_user [UserRole::Admin]
      user = User.accessible(context[:user]).find_by(id: id, email: confirmation_email)
      raise Error::NotFound, code: 'USER_NOT_FOUND' if user.blank?

      user.archive!
    end
  end
end
