if defined?(PG)
  namespace :db do
    namespace :postgresql do
      desc "enable hstore extension"
      task :enable_hstore => [:environment, :load_config] do
        ActiveRecord::Base.connection.execute('CREATE EXTENSION IF NOT EXISTS hstore;')
      end
    end

    Rake::Task['db:schema:load'].enhance ['db:enable:hstore']
  end
end
