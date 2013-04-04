require 'exstatic/engine'
require 'exstatic/validators/nonexistant_path_validator'

module Exstatic

  mattr_accessor :authorization_method
  @@authorization_method = :authorize_exstatic_pages

  mattr_accessor :authorization_actions
  @@authorization_actions = [:new, :create, :edit, :update, :destroy, :index, :show]
end
