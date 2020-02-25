Rails.application.configure do
  config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'admin.invest.beta.trinitydigital.ru'
      resource '*', headers: :any, methods: %i[get post put patch delete options head]
    end
  end

  config.cache_classes = true
  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass
  # config.sass.line_comments = false

  # config.assets.compile = false

  config.active_storage.service = :local

  # config.force_ssl = true
  config.primary_protocol = :https

  config.log_level = :debug

  config.log_tags = %i[request_id]

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment)
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "invest-api_#{Rails.env}"

  config.action_mailer.perform_caching = false

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false
end
