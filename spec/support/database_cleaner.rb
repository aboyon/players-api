module DatabaseCleaner
  def self.delete_all
    tables = ActiveRecord::Base.connection.tables
    tables.delete("schema_migrations")
    tables.delete("seed_migration_data_migrations")
    tables.each do |table|
      ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
    end
  end
end


# Ensure the DB is clean before running the suite
# only in test environment
RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.delete_all if Rails.env.test?
  end
end
