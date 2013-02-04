module Exstatic
  class Engine < ::Rails::Engine
    isolate_namespace Exstatic 

    config.exstatic = Exstatic

    initializer 'exstatic.bind_dynamic_routes', :after => :disable_dependency_loading do |app|
      begin
        app.routes.disable_clear_and_finalize = true
        app.routes.draw do
          Exstatic::Page.all.each do |p|
            get "/#{p.slug}", :to => "exstatic/pages#display"
          end
        end
      rescue 
        Rails.logger.error "Failed to bind custom page routes for Exstatic"
      ensure
        app.routes.disable_clear_and_finalize = false
        app.routes.finalize!
      end
    end
  end
end
