ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'database_cleaner'
require 'factory_girl_rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.fail_fast = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.filter_run_excluding :slow unless ENV['RUN_SLOW_TESTS'] == 'true'
  config.order = 'random'

  config.include FactoryGirl::Syntax::Methods
  config.include RSpec::Rails::RequestExampleGroup,
    type: :request, example_group: {
      :file_path => /spec\/api/
    }

  config.before(:suite) { DatabaseCleaner.clean_with(:truncation) }
  config.before(:each)  { DatabaseCleaner.strategy = :transaction }

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) { DatabaseCleaner.start }
  config.after(:each)  { DatabaseCleaner.clean }
end

FactoryGirl.define do
  sequence(:hash) { {
    :x => FactoryGirl.generate(:string),
    :y => FactoryGirl.generate(:integer),
    :z => FactoryGirl.generate(:boolean)
  } }

  sequence(:longitude, aliases: [:latitude, :lon, :lat, :geo]) {
    (90 * rand() - 90 * rand()).round(4)
  }
end
