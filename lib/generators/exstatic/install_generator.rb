require 'rails/generators/active_record'

module Exstatic
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      desc "Copies migrations and initialization components into your application"

      source_root File.expand_path("../templates", __FILE__)

      def copy_migration
        migration_template "migration.rb", "db/migrate/exstatic_create_exstatic_pages"
      end
    end
  end
end
