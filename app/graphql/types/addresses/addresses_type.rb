module Types::Addresses
  class AddressesType < Types::BaseObjectList
    field :rows, [Types::Addresses::AddressType], null: false
  end
end
