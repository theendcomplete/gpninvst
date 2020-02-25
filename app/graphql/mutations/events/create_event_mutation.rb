module Mutations::Events
  class CreateEventMutation < Mutations::BaseMutation
    DO_NOT_SEND_MAIL_STATUSES = %w[expired draft].freeze

    type Types::Events::EventType

    argument :name, String, required: true
    argument :organizer_ids, [ID], required: false
    argument :participant_ids, [ID], required: false
    argument :event_type, String, required: false
    argument :default_language, String, required: false
    argument :description, String, required: false
    argument :status_code, String, required: false
    argument :confirmable, Boolean, required: false
    argument :start_at, Scalars::DateTime, required: false
    argument :finish_at, Scalars::DateTime, required: false
    argument :event_link, String, required: false
    argument :timezones, [String], required: false
    argument :tags, [String], required: false
    argument :attachments, [Scalars::FileType], required: false
    argument :address, Types::Addresses::AddressAttributes, required: false

    def resolve(args)
      authorize_user

      if args[:attachments].present?
        attachments_size = 0
        args[:attachments].each do |att|
          attachments_size += (att.size.to_f / 2**20).round(2)
        end
        raise Error::BadRequest, code: 'INCORRECT_ATTACHMENTS_SIZE' if attachments_size >= 5
      end

      # TODO: Optimize
      tag_array = []
      if args[:tags].present?
        args[:tags].each do |tagname|
          tag = Tag.where('lower(name) = ?', tagname.downcase).first
          tag ||= Tag.create(name: tagname)
          tag_array << tag
        end
      end

      event = Event.create({ name: args[:name],
                             event_type: args[:event_type],
                             default_language: args[:default_language],
                             status_code: args[:status_code],
                             description: args[:description],
                             start_at: args[:start_at],
                             finish_at: args[:finish_at],
                             event_link: args[:event_link],
                             confirmable: args[:confirmable],
                             address: Address.where(args[:address].to_h).first_or_create,
                             timezones: args[:timezones],
                             organizers: User.where(id: args[:organizer_ids]),
                             participants: Investor.where(id: args[:participant_ids]) }.reject { |_k, v| v.blank? })

      if args[:attachments].present?
        args[:attachments].each do |attachment|
          event.attachments.attach(io: attachment.tempfile, filename: attachment.original_filename)
        end
      end

      event.tags << tag_array
      event.event_participants.find_each do |e|
        EventNotificationMailer.with(event_participant: e.id).notify_investor.deliver_later if DO_NOT_SEND_MAIL_STATUSES.exclude? event.status_code
      end
      event if event.save!
    end
  end
end
