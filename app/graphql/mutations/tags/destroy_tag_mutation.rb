module Mutations::Tags
  class DestroyTagMutation < Mutations::BaseMutation
    type Boolean

    argument :id, ID, required: true

    def resolve(id:)
      authorize_user
      tag = Tag.find_by(id: id)
      raise Error::NotFound, code: 'TAG_NOT_FOUND' if tag.blank?

      tag.destroy!
    end
  end
end
