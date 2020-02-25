Rails.application.configure do
  config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'
      resource '*', headers: :any, methods: %i[get post put patch delete options head]
    end
  end

  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local = false

  config.action_controller.perform_caching = true
  config.action_mailer.perform_caching = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.primary_protocol = :http
  config.active_storage.service = :local
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true

  config.domain = 'localhost:3000'

  # SMTP settings for yandex
  config.action_mailer.smtp_settings = {
      address: Rails.application.credentials.email_settings[:smtp_address],
      port: Rails.application.credentials.email_settings[:smtp_port],
      user_name: Rails.application.credentials.email_settings[:smtp_user],
      password: Rails.application.credentials.email_settings[:smtp_password],
      from: Rails.application.credentials.email_settings[:from],
      authentication: 'plain',
      enable_starttls_auto: true,
      tls: true
  }

  config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
    Bullet.add_footer = true
  end
end
