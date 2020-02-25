event_types = %w[call event meeting].freeze
true_false = [true, false].freeze
time_zones = %w[Europe/Moscow Europe/Minsk America/Coral_Harbour America/North_Dakota/Center America/North_Dakota/New_Salem].freeze

10.times do
  FactoryBot.create(:user)
end

100.times do
  FactoryBot.create(:investor)
end

20.times do
  FactoryBot.create(:tag)
end

1_000.times do
  e = FactoryBot.build(:event)
  e.event_type = event_types.sample
  e.update(status_code: 'upcoming')
  time_zones.sample(3).each do |tz|
    e.timezones << tz
  end
  e.organizers << User.all.sample(3)
  e.participants << Investor.all.sample(12)
  e.tags << Tag.all.sample(rand(1..3)) if true_false.sample
  e.save
end
