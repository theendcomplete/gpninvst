class ApplicationMailer < ActionMailer::Base
  Rails.application.credentials.email_settings[:from].to_s
  default from: Rails.application.credentials.email_settings[:from].to_s
  layout 'mailer'
end
