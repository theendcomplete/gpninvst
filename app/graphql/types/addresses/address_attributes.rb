module Types::Addresses
  class AddressAttributes < InputObjects::BaseInputObject
    description 'Attributes for creating or updating an address'

    argument :id, ID, 'ID of the address', required: false
    argument :address_string, String, 'Address String', required: false
    argument :city, String, 'Address City', required: false
    argument :country, String, 'Address Country', required: false
    argument :postalcode, String, 'Address Postal code', required: false
    argument :latitude, Float, 'Address latitude', required: false
    argument :longitude, Float, 'Address longitude', required: false
  end
end
