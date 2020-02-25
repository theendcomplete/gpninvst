module Mutations::Tags
  class UpdateTagMutation < Mutations::BaseMutation
    type Types::Tags::TagType

    argument :id, ID, required: true
    argument :name, String, required: false

    def resolve(args)
      authorize_user
      tag = Tag.find_by(id: args[:id])
      raise Error::NotFound, code: 'NOTE_NOT_FOUND' if tag.blank?

      tag.update!(args)
      tag
    end
  end
end
