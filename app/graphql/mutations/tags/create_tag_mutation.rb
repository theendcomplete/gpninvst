module Mutations::Tags
  class CreateTagMutation < Mutations::BaseMutation
    type Types::Tags::TagType

    argument :name, String, required: true

    def resolve(args)
      authorize_user
      Tag.create!(args)
    end
  end
end
