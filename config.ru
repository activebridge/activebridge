# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

Thread.abort_on_exception = false

Thread.new do
  Bot::SlackRealtime.run
end

run Rails.application
