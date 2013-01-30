RailsApp::Application.routes.draw do
  mount Exstatic::Engine => "/pages", :as => 'exstatic'
end
