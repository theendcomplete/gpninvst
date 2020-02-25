class CreateInvestorAttrs < ActiveRecord::Migration[6.0]
  def change
    create_view :investor_attrs
  end
end
