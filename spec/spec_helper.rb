Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

RSpec.configure do |config|
  config.fail_fast = true
  config.use_transactional_fixtures = false

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.filter_run_excluding :slow unless ENV['RUN_SLOW_TESTS'] == 'true'

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
