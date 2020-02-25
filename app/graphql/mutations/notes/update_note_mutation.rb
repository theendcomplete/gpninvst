module Mutations::Notes
  class UpdateNoteMutation < Mutations::BaseMutation
    type Types::Notes::NoteType

    argument :id, ID, required: true
    argument :title, String, required: false
    argument :text, String, required: false
    argument :investor_id, ID, required: false

    def resolve(args)
      authorize_user
      note = Note.accessible(context[:user]).find_by(id: args[:id])
      raise Error::NotFound, code: 'NOTE_NOT_FOUND' if note.blank?

      note.update!(args)
      note
    end
  end
end
