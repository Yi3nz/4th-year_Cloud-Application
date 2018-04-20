require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Smartcare
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    #Reference https://www.youtube.com/watch?v=t497x6WLPY4&t=688s
    #Activate the observer that should always be running
    config.active_record.observers = :consultation_observer
    config.autoload.path += %W(#{config.root}/app/decorators)
    config.autoload_paths << File.expand_path('/app/decorators', __dir__)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
