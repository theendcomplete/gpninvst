module Mutations::Investors
  class CreateInvestorMutation < Mutations::BaseMutation
    type Types::Investors::InvestorType

    argument :email, String, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :institution_title, String, required: true
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
      authorize_user [UserRole::Admin]
      investor = Investor.create!(args)
      investor
    end
  end
end
