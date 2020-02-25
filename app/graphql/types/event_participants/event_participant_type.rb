module Types::EventParticipants
  class EventParticipantType < Types::BaseObject
    field :id, ID, null: false
    field :investor, Types::Investors::InvestorType, null: false, description: 'Returns an investor for event'
    field :event, Types::Events::EventType, null: false, description: 'Returns an associated event'
    field :confirmed, Boolean, null: false

    field :created_at, Scalars::DateTime, null: false
    field :updated_at, Scalars::DateTime, null: false
  end
end
