require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "rails/test_unit/railtie"

Bundler.require :default, STATIC_CHARGE_ORM

begin
    require "#{STATIC_CHARGE_ORM}/railtie"
rescue LoadError
end

require "static_charge"

module RailsApp
  class Application < Rails::Application
    config.autoload_paths.reject!{ |p| p =~ /\/app\/(\w+)$/ && !%w(controllers helpers views).include?($1) }

    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.assets.enabled = false
  end
end
