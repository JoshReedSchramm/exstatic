RailsApp::Application.routes.draw do
  get "/custompage", :to => "home#custom_route", :as => :custom
  mount Exstatic::Engine => "/exstatic", :as => 'exstatic'
end
