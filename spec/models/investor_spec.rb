require 'rails_helper'

RSpec.describe Investor, type: :model do
  subject(:investor) do
    build(:investor)
  end

  it 'is not valid without a email' do
    investor.email = nil

    expect(investor).to_not be_valid
  end

  it 'is not valid with mail less than 6 symbols' do
    investor.email = 't@t.r'
    expect(investor).to_not be_valid
  end
end
