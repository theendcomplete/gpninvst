module Mutations::Notes
  class DestroyNoteMutation < Mutations::BaseMutation
    type Boolean

    argument :id, ID, required: true

    def resolve(id:)
      authorize_user
      note = Note.accessible(context[:user]).find_by(id: id)
      raise Error::NotFound, code: 'NOTE_NOT_FOUND' if note.blank?

      note.destroy!
    end
  end
end
