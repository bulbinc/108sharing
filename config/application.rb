require_relative 'boot'

require 'rails/all'

# # Pick the frameworks you want:
# require "active_model/railtie"
# require "active_job/railtie"
# require "active_record/railtie"
# require "active_storage/engine"
# require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# # require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sharing
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.encoding  = "utf-8"
    config.paths.add 'lib', eager_load: true

    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local

    I18n.enforce_available_locales = true
    config.i18n.default_locale = :ja
    config.i18n.available_locales = %i(ja en ko zh-cn zh-tw)
    config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]

    config.generators do |g|
      g.helper false
      g.assets false
      g.view_specs false
      g.controller_specs false
      g.helper_specs false
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, :dir => 'spec/factories'
    end

    config.generators.system_tests = nil
    config.active_job.queue_adapter = :sidekiq
  end
end
