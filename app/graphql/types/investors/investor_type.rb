module Types::Investors
  class InvestorType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :full_name, String, null: true
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :phone, String, null: true
    field :institution_title, String, null: true
    field :institution_type_title, String, null: true
    field :side_title, String, null: true
    field :asset_class_title, String, null: true
    field :job_function_title, String, null: true
    field :status, String, null: true
    field :last_active_at, Scalars::DateTime, null: true
    field :geo_region, String, null: true
    field :country, String, null: true
    field :city, String, null: true
    field :address, String, null: true
    field :created_at, Scalars::DateTime, null: false
    field :updated_at, Scalars::DateTime, null: false
  end
end
