module Types::Notes
  class NotesType < Types::BaseObjectList
    field :rows, [Types::Notes::NoteType], null: false
  end
end
