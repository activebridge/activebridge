ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'support/login_helper'
require 'rspec/rails'
require 'rspec/autorun'
require 'simplecov'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'rack_session_access'
require 'rack_session_access/capybara'
require 'database_cleaner'

SimpleCov.start 'rails'

DEFAULT_PORT = 9887
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.asset_host = 'http://localhost:3000'
Capybara.server_port = DEFAULT_PORT
Capybara.app_host = "http://blog.lvh.me:#{Capybara.server_port}"
DatabaseCleaner.strategy = :truncation

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, window_size: [1200, 700], js_errors: false)
  # TODO; JS errors should be true
end

RSpec.configure do |config|
  config.include LoginHelper, type: :feature
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
