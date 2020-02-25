class AddSideToInvestor < ActiveRecord::Migration[6.0]
  def change
    add_column :investors, :side_title, :string
  end
end
