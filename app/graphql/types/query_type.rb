module Types
  class QueryType < Types::BaseObject
    field :profile, Types::Users::UserType, null: false

    def profile
      authorize_user
      User.find(context[:user].id)
    end

    field :users, type: Types::Users::UsersType, null: false, extensions: [FieldExtensions::ListExtension]

    def users(options:)
      authorize_user [UserRole::Admin]
      User.accessible(context[:user])
    end

    field :investors, type: Types::Investors::InvestorsType, null: false, extensions: [FieldExtensions::ListExtension]

    def investors(options:)
      authorize_user
      Investor.eager_load(:attrs).accessible(context[:user])
    end

    field :notes, type: Types::Notes::NotesType, null: false, extensions: [FieldExtensions::ListExtension]

    def notes(options:)
      authorize_user
      Note.eager_load(:investor).accessible(context[:user])
    end

    field :events, type: Types::Events::EventsType, null: false, extensions: [FieldExtensions::ListExtension]

    def events(options:)
      authorize_user
      Event.includes(%i[event_organizers event_participants participants organizers tags event_tags address]).accessible(context[:user])
    end

    field :tags, type: Types::Tags::TagsType, null: false, extensions: [FieldExtensions::ListExtension]

    def tags(options:)
      authorize_user
      Tag.all.includes(%i[event_tags events])
    end

    field :addresses, type: Types::Addresses::AddressesType, null: false, extensions: [FieldExtensions::ListExtension]

    def addresses(options:)
      authorize_user
      Address.all.includes(%i[events])
    end
  end
end
