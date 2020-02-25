module Types::EventOrganizers
  class EventOrganizersType < Types::BaseObjectList
    field :rows, [Types::EventOrganizers::EventOrganizerType], null: false
  end
end
