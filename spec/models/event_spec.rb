require 'rails_helper'

RSpec.describe Event, type: :model do
  subject(:event) do
    build(:event)
  end

  it 'draft is valid with just name' do
    expect(event).to be_valid
  end

  it 'is not valid without a name' do
    event.name = nil

    expect(event).to_not be_valid
  end

  it 'call is not valid without a start_at' do
    event.event_type = 'call'
    event.status_code = 'upcoming'
    event.start_at = nil

    expect(event).to_not be_valid
  end

  it 'call is not valid without a finish_at' do
    event.event_type = 'call'
    event.status_code = 'upcoming'
    event.finish_at = nil

    expect(event).to_not be_valid
  end

  it 'call is not valid without at least 1 organizer' do
    event.event_type = 'call'
    event.status_code = 'upcoming'
    event.organizers << create(:user)

    expect(event).to_not be_valid
  end

  it 'call is not valid without at least 1 participant' do
    event.event_type = 'call'
    event.status_code = 'upcoming'
    event.participants << create(:investor)

    expect(event).to_not be_valid
  end

  it 'can be associated with event' do
    tag = create(:tag)
    user = create(:user)
    participant = create(:investor)
    event.event_type = 'call'
    event.save
    event.organizers << user
    event.participants << participant
    event.update(status_code: 'upcoming')

    event.tags << tag
    expect(event.tags.count).to eq(1)
  end
end
