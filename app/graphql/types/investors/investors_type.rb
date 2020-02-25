module Types::Investors
  class InvestorsType < Types::BaseObjectList
    field :rows, [Types::Investors::InvestorType], null: false
  end
end
