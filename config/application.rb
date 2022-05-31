require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module R5template
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.generators.test_framework = :rspec
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    POUNOU_DOMAIN = 'pounoupro.cat'.freeze
    # show current exercise from system environment
    config.year = (ENV.fetch('YEAR') { Time.zone.today.year }).to_i
    config.year_last_digit = config.year.to_s[-1]

    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default_url_options =
      if Rails.env.production?
        { host: "http://#{config.year}.#{POUNOU_DOMAIN}" }
      else
        { host: 'localhost:3000' }
      end
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings =
      if Rails.env.production?
        {
          domain: POUNOU_DOMAIN,
          user_name: ENV.fetch('MAIL_USER', nil),
          password: ENV.fetch('MAIL_PASS', nil),
          authentication: 'plain',
          port: 25,
          address: 'smtp.eu.mailgun.org'
        }
      else
        {
          domain: POUNOU_DOMAIN,
          user_name: ENV.fetch('PN_MAIL_USER', nil),
          password: ENV.fetch('PN_MAIL_PASS', nil),
          authentication: 'plain',
          port: 25,
          address: 'smtp.eu.mailgun.org'
        }
      end

    # http://www.createdbypete.com/articles/working-with-locales-and-time-zones-in-rails/
    config.time_zone = 'Madrid'
    config.active_record.default_timezone = :local

    config.middleware.use I18n::JS::Middleware
  end
end
