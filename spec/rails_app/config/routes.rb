RailsApp::Application.routes.draw do
  mount StaticCharge::Engine => "/pages", :as => 'static_charge'
end
