module Mutations::Events
  class UpdateEventMutation < Mutations::BaseMutation
    type Types::Events::EventType

    argument :id, ID, required: true
    argument :name, String, required: false
    argument :organizer_ids, [ID], required: false
    argument :participant_ids, [ID], required: false
    argument :event_type, String, required: false
    argument :default_language, String, required: false
    argument :status_code, String, required: false
    argument :description, String, required: false
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

      event = Event.accessible(context[:user]).find_by(id: args[:id])

      raise Error::NotFound, code: 'EVENT_NOT_FOUND' if event.blank?

      # TODO: Optimize
      tag_array = []
      if args[:tags].present?
        args[:tags].each do |tagname|
          tag = Tag.where('lower(name) = ?', tagname.downcase).first
          tag ||= Tag.create(name: tagname)
          tag_array << tag
        end
      end

      event.update({ name: args[:name],
                     event_type: args[:event_type],
                     default_language: args[:default_language],
                     status_code: args[:status_code],
                     description: args[:description],
                     start_at: args[:start_at],
                     finish_at: args[:finish_at],
                     event_link: args[:event_link],
                     confirmable: args[:confirmable],
                     timezones: args[:timezones],
                     address: Address.where(args[:address].to_h).first_or_create,
                     tags: tag_array,
                     organizers: User.where(id: args[:organizer_ids]),
                     participants: Investor.where(id: args[:participant_ids]) }.reject { |_k, v| v.blank? })

      if args[:attachments].present?
        args[:attachments].each do |attachment|
          event.attachments.attach(io: attachment.tempfile, filename: attachment.original_filename)
        end
      end
      event
    end
  end
end
