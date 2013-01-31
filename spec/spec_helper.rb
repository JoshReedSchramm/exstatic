ENV['RAILS_ENV'] = 'test'

require 'rails_app/config/environment'
require 'rails/test_help'

require 'rubygems'
require 'rspec/rails'

require 'exstatic'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.include Exstatic::Engine.routes.url_helpers
  config.include Rails.application.routes.mounted_helpers
end
