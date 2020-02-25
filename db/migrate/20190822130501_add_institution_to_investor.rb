class AddInstitutionToInvestor < ActiveRecord::Migration[6.0]
  def change
    change_table :investors, bulk: true do |t|
      t.string :institution_title
      t.string :institution_type_title
    end
  end
end
