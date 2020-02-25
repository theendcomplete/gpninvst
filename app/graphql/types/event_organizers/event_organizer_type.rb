module Types::EventOrganizers
  class EventOrganizerType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::Users::UserType, null: false, description: 'Returns organizers for event'
    field :event, Types::Events::EventType, null: false, description: 'Returns an associated event'
    field :creator, Boolean, null: false

    field :created_at, Scalars::DateTime, null: false
    field :updated_at, Scalars::DateTime, null: false
  end
end
