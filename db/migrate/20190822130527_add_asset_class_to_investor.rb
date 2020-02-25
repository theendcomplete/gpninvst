class AddAssetClassToInvestor < ActiveRecord::Migration[6.0]
  def change
    add_column :investors, :asset_class_title, :string
  end
end
