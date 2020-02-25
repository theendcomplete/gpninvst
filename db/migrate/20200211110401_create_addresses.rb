class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_string
      t.string :city
      t.string :country
      t.string :postalcode
      t.float :latitude
      t.float :longitude
      t.jsonb :address_data

      t.timestamps
    end
    remove_column :events, :address, :string, null: true
    add_column :events, :address_id, :integer, null: true
  end
end
