module Mutations::Investors
  class UpdateInvestorMutation < Mutations::BaseMutation
    type Types::Investors::InvestorType

    argument :id, ID, required: true
    argument :email, String, required: false
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :institution_title, String, required: false
    argument :institution_type_title, String, required: false
    argument :phone, String, required: false
    argument :side_title, String, required: false
    argument :asset_class_title, String, required: false
    argument :job_function_title, String, required: false
    argument :status, String, required: false
    argument :last_active_at, Scalars::DateTime, required: false
    argument :geo_region, String, required: false
    argument :country, String, required: false
    argument :city, String, required: false
    argument :address, String, required: false

    def resolve(args)
      authorize_user
      investor = Investor.accessible(context[:user]).find_by(id: args[:id])
      raise Error::NotFound, code: 'INVESTOR_NOT_FOUND' if investor.blank?

      investor.update!(args)
      investor
    end
  end
end
