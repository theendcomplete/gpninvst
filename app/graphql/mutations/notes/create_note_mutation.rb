module Mutations::Notes
  class CreateNoteMutation < Mutations::BaseMutation
    type Types::Notes::NoteType

    argument :title, String, required: true
    argument :text, String, required: true
    argument :investor_id, ID, required: false

    def resolve(args)
      authorize_user
      context[:user].notes.create!(args)
    end
  end
end
