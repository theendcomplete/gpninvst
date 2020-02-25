class CreateInvestors < ActiveRecord::Migration[6.0]
  def change
    create_table :investors do |t|
      t.string :first_name, limit: 48
      t.string :last_name, limit: 48

      t.string :email, limit: 72, index: { unique: false }
      t.string :phone, limit: 48, index: { unique: false }

      t.string :geo_region
      t.string :country
      t.string :city
      t.string :address

      t.string :status
      t.date :last_active_at

      t.timestamps
    end
  end
end
