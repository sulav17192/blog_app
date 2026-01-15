require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Make code changes take effect immediately without server restart.
  config.enable_reloading = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing.
  config.server_timing = true

  # Enable/disable Action Controller caching
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.public_file_server.headers = { "cache-control" => "public, max-age=#{2.days.to_i}" }
  else
    config.action_controller.perform_caching = false
  end

  # Change to :null_store to avoid any caching in development
  config.cache_store = :memory_store

  # Store uploaded files on the local file system
  config.active_storage.service = :local

  # Action Mailer settings
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.smtp_settings = {
    address:              "smtp.gmail.com",
    port:                 587,
    domain:               "gmail.com",
    user_name:            ENV["GMAIL_USERNAME"],
    password:             ENV["GMAIL_PASSWORD"],
    authentication:       :plain,
    enable_starttls_auto: true
  }

  # Make template changes take effect immediately
  config.action_mailer.perform_caching = false

  # Use localhost in mailer links
  config.action_mailer.default_url_options = { host: "localhost", port: 3000 }

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs
  config.active_record.verbose_query_logs = true

  # Append comments with runtime information tags to SQL queries
  config.active_record.query_log_tags_enabled = true

  # Highlight background job enqueues
  config.active_job.verbose_enqueue_logs = true

  # Highlight redirects
  config.action_dispatch.verbose_redirect_logs = true

  # Suppress logger output for asset requests
  config.assets.quiet = true

  # Raises error for missing translations (uncomment when needed)
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with template filenames
  config.action_view.annotate_rendered_view_with_filenames = true

  # Raise error on missing callback actions
  config.action_controller.raise_on_missing_callback_actions = true
end