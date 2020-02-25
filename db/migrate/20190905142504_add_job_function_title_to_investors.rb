class AddJobFunctionTitleToInvestors < ActiveRecord::Migration[6.0]
  def change
    add_column :investors, :job_function_title, :string
  end
end
