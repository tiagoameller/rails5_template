require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module R5template
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators.test_framework = :rspec
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # show current exercise from system environment
    config.year = (ENV.fetch('YEAR') { Time.zone.today.year }).to_i
    config.year_last_digit = config.year.to_s[-1]

    # http://www.createdbypete.com/articles/working-with-locales-and-time-zones-in-rails/
    config.time_zone = 'Madrid'
    config.active_record.default_timezone = :local
  end
end
