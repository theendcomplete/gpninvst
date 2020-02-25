class EventNotificationMailer < ApplicationMailer
  def notify_investor
    @event_participant = EventParticipant.find(params[:event_participant])
    @investor = @event_participant.investor
    @event = @event_participant.event
    @endpoint = "#{Rails.application.credentials.dig(:yandex, :endpoint)}/#{Rails.application.credentials.dig(:yandex, :bucket)}/"
    @event.attachments.each do |att|
      attachments.inline[att.filename.to_s] = { mime_type: att.content_type, content: att.blob.download }
    end
    mail(to: @investor.email, subject: @event.name)
  end
end
