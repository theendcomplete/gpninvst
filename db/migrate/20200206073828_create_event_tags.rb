class CreateEventTags < ActiveRecord::Migration[6.0]
  def change
    create_table :event_tags do |t|
      t.belongs_to :tag
      t.belongs_to :event

      t.timestamps

      t.index(%i[event_id tag_id], unique: true)
    end
  end
end
