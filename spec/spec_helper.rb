require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'

require "rails/application"
require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'its'
require 'database_cleaner'
require 'capybara/rspec'
require 'capybara/webkit'# if ENV['WEBKIT']
require 'shoulda-matchers'

Capybara.javascript_driver = :webkit


Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_base_class_for_anonymous_controllers = false
  config.filter_run focus: true
  config.order = "random"
  config.run_all_when_everything_filtered = true
  config.infer_spec_type_from_file_location!

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation #example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end
  
  config.after(:each) do
    DatabaseCleaner.clean
  end
  
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec
    with.library :rails
  end
end

