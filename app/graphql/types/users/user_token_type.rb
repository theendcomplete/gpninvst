module Types::Users
  class UserTokenType < Types::BaseObject
    field :token, String, null: false
    field :fcm_topic_name, String, null: false
    field :created_at, Scalars::DateTime, null: false
    field :updated_at, Scalars::DateTime, null: false
    field :user, Types::Users::UserType, null: false
  end
end
