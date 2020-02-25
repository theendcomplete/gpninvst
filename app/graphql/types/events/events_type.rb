module Types::Events
  class EventsType < Types::BaseObjectList
    field :rows, [Types::Events::EventType], null: false
  end
end
