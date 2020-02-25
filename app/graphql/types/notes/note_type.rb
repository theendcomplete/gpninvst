module Types::Notes
  class NoteType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :text, String, null: true
    field :text_short, String, null: true
    field :investor, Types::Investors::InvestorType, null: true
    field :user, Types::Users::UserType, null: false
    field :created_at, Scalars::DateTime, null: false
    field :updated_at, Scalars::DateTime, null: false
  end
end
