require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject(:tag) do
    build(:tag)
  end

  it 'is valid with just name' do
    expect(tag).to be_valid
  end

  it 'is not valid without name' do
    tag.name = nil
    expect(tag).to_not be_valid
  end

  it 'can be associated with event' do
    event = build(:event)
    user = create(:user)
    participant = create(:investor)
    event.event_type = 'call'
    event.save
    event.organizers << user
    event.participants << participant
    event.update(status_code: 'upcoming')

    tag.save
    event.tags << tag
    expect(tag.events.count).to eq(1)
  end
end
