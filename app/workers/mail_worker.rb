require 'faraday'
require 'json'
require 'erb'

class MailWorker
  include Sidekiq::Worker
  sidekiq_options queue: :mails, retry: 3, dead: false

  def perform(template = 'default', params = {})
    message = ViewHelper.render('workers/mails/' + template, params['view'])

    sender = params['sender']
    recipients = params['recipients']
    subject = params['subject']

    log_message = "From: #{sender}\nTo: #{recipients.join(', ')}\nSubject: #{subject}\n\n#{message}"

    adapter = params['adapter'] || Rails.configuration.app['email_adapter']
    case adapter
    when 'console'
      p 'Mail message'
      p log_message
    when 'slack'
      SlackHelper.info('Mail message', log_message)
    when 'smsc'
      SmscHelper.send(subject, sender, recipients, message)
    end
  end
end
