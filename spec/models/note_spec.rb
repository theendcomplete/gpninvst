require 'rails_helper'

RSpec.describe Note, type: :model do
  subject(:note) do
    build(:note)
  end

  it 'is not valid without title' do
    note.title = nil
    expect(note).to_not be_valid
  end

  it 'is valid without text' do
    note.text = nil
    expect(note).to be_valid
  end
end
