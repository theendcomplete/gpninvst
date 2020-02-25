class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.integer :event_type, null: false, default: 0
      t.integer :default_language, null: false, default: 0
      t.integer :status_code, null: false, default: 0
      t.text :description, null: true
      t.datetime :start_at, null: true
      t.datetime :finish_at, null: true
      t.text :timezones, null: true
      t.text :event_link, null: true
      t.boolean :confirmable, null: false, default: false
      t.text :address, null: true

      t.timestamps

      t.index(:event_type)
      t.index(:status_code)
      t.index(:default_language)
      t.index(:confirmable)
    end
  end
end
