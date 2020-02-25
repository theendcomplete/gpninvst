module Types::Tags
  class TagType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :events, Types::Events::EventsType, null: true

    field :created_at, Scalars::DateTime, null: false
    field :updated_at, Scalars::DateTime, null: false
  end
end
