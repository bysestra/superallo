require_relative 'boot'
require_relative '../lib/account_middleware'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Superallo
  class Application < Rails::Application
    # Expose our application's helpers to Administrate
    config.to_prepare do
      Administrate::ApplicationController.helper Superallo::Application.helpers
    end
    config.active_job.queue_adapter = :sucker_punch
    config.application_name = 'Allowee'
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.i18n.available_locales = %i[ en fr ]
    config.i18n.default_locale = :fr

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.middleware.use AccountMiddleware
  end
end
