RailsApp::Application.routes.draw do
  get "/custompage", :to => "home#custom_route", :as => :custom
  mount Exstatic::Engine => "/exstatic", :as => 'exstatic'

  # Preserve this route for testing existing route validator
  get "/foo/bar", :to => "exstatic/pages#display"

  # This route will eventually be replaced by dynamic route binding at initialization
  get "/foo", :to => "exstatic/pages#display"
end
