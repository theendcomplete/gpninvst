class InvestorAttr < ApplicationRecord
  self.primary_key = :investor_id

  belongs_to :investor

  def readonly?
    true
  end
end
