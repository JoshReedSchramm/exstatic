module Exstatic
  module Validators
    class NonexistantPathValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        return true if value.blank?

        path = '/' + value

        begin
          if Rails.application.routes.recognize_path(path, :method => :get)
            object.errors[attribute] << (options[:message] || "matches an existing path")
          end
        rescue ActionController::RoutingError
        end
      end
    end
  end
end
