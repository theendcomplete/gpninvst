class AddUuidToEventParticipant < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'uuid-ossp'
    add_column :event_participants, :uuid, :uuid, default: 'uuid_generate_v4()', null: false
    add_index :event_participants, :uuid, unique: true
  end
end
