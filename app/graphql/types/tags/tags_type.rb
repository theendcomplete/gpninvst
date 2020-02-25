module Types::Tags
  class TagsType < Types::BaseObjectList
    field :rows, [Types::Tags::TagType], null: false
  end
end
