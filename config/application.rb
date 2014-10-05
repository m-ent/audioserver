require File.expand_path('../boot', __FILE__)

require 'rails/all'
require_relative '../lib/id_validation'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Audioserver
  class Application < Rails::Application

    # hp_id の validation を行うか否か
    config.id_validation = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Tokyo'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # I18n locale validation
    config.i18n.enforce_available_locales = true

    # to auto load lib/ directory
    #config.autoload_paths += %W(#{config.root}/lib)
  end
end
