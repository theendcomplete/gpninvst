module Mutations::Users
  class DestroyProfileMutation < Mutations::BaseMutation
    type Boolean

    argument :confirmation_email, String, required: true

    def resolve(confirmation_email)
      authorize_user []
      raise Error::Forbidden if context[:user].email != confirmation_email

      context[:user].archive!
    end
  end
end
