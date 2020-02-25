true_false_array = [true, false].freeze

FactoryBot.define do
  factory :address do
    address_string { Faker::Address.full_address }
    city { Faker::Address.city }
    country { Faker::Address.country }
    postalcode { Faker::Address.postcode }
    address_data { '' }
  end

  factory :tag do
    name { Faker::Game.unique.genre }
  end

  factory :note do
    investor { create(:investor) }
    user { create(:user) }
    title { Faker::Game.title }
    text { Faker::Movies::HarryPotter.character }
  end

  factory :user do
    login { Faker::Internet.user_name }
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    role_code { 'client' }
    status_code { 'registered' }
  end

  factory :event do
    name { Faker::Game.title }
    event_type { Event.event_types[0] }
    default_language { 'ru' }
    status_code { 'draft' }
    description { Faker::ChuckNorris.fact }
    start_at { Time.zone.now + rand(-12_000..60_000).minutes }
    finish_at { start_at + rand(30..90).minutes }
    event_link { Faker::Internet.url }
    confirmable { true_false_array.sample }
    address { Address.create(address_string: Faker::Address.full_address) }
  end

  factory :investor do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone_with_country_code }
    country { Faker::Address.country }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
  end
end
