RailsApp::Application.routes.draw do
  mount Exstatic::Engine => "/exstatic", :as => 'exstatic'
end
