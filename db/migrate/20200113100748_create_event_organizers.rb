class CreateEventOrganizers < ActiveRecord::Migration[6.0]
  def change
    create_table :event_organizers do |t|
      t.belongs_to :user
      t.belongs_to :event
      t.boolean :creator, null: false, default: false

      t.timestamps

      t.index(%i[user_id event_id], unique: true)
    end
  end
end
