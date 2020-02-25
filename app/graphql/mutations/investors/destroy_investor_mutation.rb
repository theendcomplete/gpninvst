module Mutations::Investors
  class DestroyInvestorMutation < Mutations::BaseMutation
    type Boolean

    argument :id, ID, required: true

    def resolve(id:)
      authorize_user [UserRole::Admin]
      investor = Investor.accessible(context[:user]).find_by(id: id)
      raise Error::NotFound, code: 'INVESTOR_NOT_FOUND' if investor.blank?

      investor.destroy!
    end
  end
end
