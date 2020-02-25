module Types::Addresses
  class AddressType < Types::BaseObject
    field :id, ID, null: false
    field :address_string, String, null: false
    field :city, String, null: true
    field :country, String, null: true
    field :postalcode, String, null: true
    field :latitude, Float, null: true
    field :longitude, Float, null: true
    field :events, Types::Events::EventsType, null: true

    field :created_at, Scalars::DateTime, null: false
    field :updated_at, Scalars::DateTime, null: false
  end
end
