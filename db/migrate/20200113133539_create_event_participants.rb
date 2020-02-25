class CreateEventParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :event_participants do |t|
      t.belongs_to :investor, null: false
      t.belongs_to :event, null: false
      t.boolean :confirmed, null: false, default: false

      t.timestamps

      t.index(%i[investor_id event_id], unique: true)
    end
  end
end
