class EventParticipant < ApplicationRecord
  DO_NOT_SEND_MAIL_STATUSES = %w[expired draft].freeze
  belongs_to :investor
  belongs_to :event

  before_create do |e|
    e.uuid = randomize_uuid
  end

  # after_commit do |e|
  #   EventNotificationMailer.with(event_participant: e.id).notify_investor.deliver_later if DO_NOT_SEND_MAIL_STATUSES.include? event.status_code
  # end

  private

  def randomize_uuid
    SecureRandom.uuid
  end
end
