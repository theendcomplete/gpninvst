class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :text
      t.references :user, null: false, foreign_key: true
      t.references :investor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
