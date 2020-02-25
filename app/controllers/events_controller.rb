class EventsController < ApplicationController
  before_action :set_event_participant_by_uuid, only: %i[confirm decline]
  before_action :set_endpoint, only: %i[confirm decline]
  def confirm
    @event_participant.update(confirmed: true)

    render :confirm, status: :ok
  end

  # Stub
  def decline
    @event_participant.update(confirmed: false)

    render :decline, status: :ok
  end

  private

  def set_event_participant_by_uuid
    @event_participant = EventParticipant.where(uuid: params[:uuid]).first
    raise Error::NotFound, code: 'EVENT_PARTICIPANT_NOT_FOUND' if @event_participant.blank?

    @event = @event_participant.event
  end

  def set_endpoint
    @endpoint = "#{Rails.application.credentials.dig(:yandex, :endpoint)}/#{Rails.application.credentials.dig(:yandex, :bucket)}/"
  end
end
