ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The app is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/poltergeist'
require 'support/host_helper'
require 'shoulda/matchers'
require 'support/shared_examples/generate_message'

Dir["#{Rails.root}/bot/**/*.rb"].each {|file| require file }

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

Capybara.javascript_driver = :poltergeist

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
  config.include HostHelper
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.verbose_retry = true
  config.display_try_failure_messages = true

  config.around :each, :js do |ex|
    ex.run_with_retry retry: 3
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = Capybara.current_driver == :rack_test ? :transaction : :truncation
    DatabaseCleaner.clean
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:each) do
    if Rails.env.test? || Rails.env.cucumber?
      FileUtils.rm_rf(Dir["#{Rails.root}/spec/support/uploads"])
    end
  end

  config.before(:each) do
    allow_any_instance_of(BaseUploader).to receive(:tinify).and_return(nil)
  end
end
