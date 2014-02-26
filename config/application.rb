require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'

Bundler.require(:default, Rails.env) if defined? Bundler

module Proto
  class Application < Rails::Application
    config.autoload_paths << "#{config.root}/lib"
    config.autoload_paths << "#{config.root}/api"

    config.paths.add 'app/api', glob: "**/*.rb"

    config.assets.paths << Rails.root.join('Rails', 'assets', 'components')

    config.time_zone = 'Moscow'

    I18n.config.enforce_available_locales = true

    config.i18n.available_locales = [:en, :ru]
    config.i18n.default_locale = :ru

    config.middleware.use(Rack::Config) do |env|
      env['api.tilt.root'] = Rails.root.join("app", "views", "api")
    end
  end
end
