ENV['RAILS_ENV'] = 'test'

require 'rails_app/config/environment'
require 'rails/test_help'

require 'rubygems'
require 'bundler/setup'
require 'rspec/rails'

require 'static_charge'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # Some config options
end
