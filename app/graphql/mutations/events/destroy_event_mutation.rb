module Mutations::Events
  class DestroyEventMutation < Mutations::BaseMutation
    type Boolean

    argument :id, ID, required: true

    def resolve(id:)
      authorize_user
      event = Event.accessible(context[:user]).find_by(id: id)
      raise Error::NotFound, code: 'EVENT_NOT_FOUND' if event.blank?

      event.destroy!
    end
  end
end
