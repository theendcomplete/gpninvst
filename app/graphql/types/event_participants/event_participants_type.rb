module Types::EventParticipants
  class EventParticipantsType < Types::BaseObjectList
    field :rows, [Types::EventParticipants::EventParticipantType], null: false
  end
end
