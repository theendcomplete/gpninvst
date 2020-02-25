module Types::Events
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :event_type, String, null: true
    field :default_language, String, null: true
    field :status_code, String, null: true
    field :description, String, null: true
    field :start_at, Scalars::DateTime, null: true
    field :finish_at, Scalars::DateTime, null: true
    field :timezones, [String], null: true
    field :event_link, String, null: true
    field :confirmable, Boolean, null: false
    field :address, Types::Addresses::AddressType, null: true
    field :organizers, Types::Users::UsersType, null: true, description: 'Returns a list of organizers for event'
    field :participants, Types::Investors::InvestorsType, null: true, description: 'Returns a list of participants for event'
    field :event_organizers, Types::EventOrganizers::EventOrganizersType, null: true
    field :event_participants, Types::EventParticipants::EventParticipantsType, null: true
    field :tags, Types::Tags::TagsType, null: true
    field :participants_confirmed_count, Integer, null: true
    field :file_links, [String], null: true

    def file_links
      urls = []
      # if object.attachments.size > 0
      object.attachments.each do |attachment|
        urls << Rails.application.routes.url_helpers.rails_blob_url(attachment)
        # end
      end
      urls
    end

    field :created_at, Scalars::DateTime, null: false
    field :updated_at, Scalars::DateTime, null: false
  end
end
