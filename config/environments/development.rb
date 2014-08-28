Subdomain::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  config.action_mailer.default_url_options = { host: 'localhost:3000' }

  config.fb_appid = '521775957892567'
  config.fb_app_secret = 'd4de572ec4cb758c93d9af4348eeb3c1'

  config.twitter_appid = 'atXvSH3zKDj0n1iqKOjE9A'
  config.twitter_app_secret = 'v24p6Q9AbyB7l4ec9xsYBhfOzJ4U4tiunssHW6H0E'

  config.linkedin_appid = '75qv4m49pms7dz'
  config.linkedin_app_secret = 'oN5PTK4xlKMpfNmY'
end
