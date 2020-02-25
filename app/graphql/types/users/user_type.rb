module Types::Users
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :login, String, null: false
    field :email, String, null: false
    field :role_code, String, null: false
    field :status_code, String, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :created_at, Scalars::DateTime, null: false
    field :updated_at, Scalars::DateTime, null: false
    field :archived_at, Scalars::DateTime, null: true
  end
end
