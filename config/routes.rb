StaticCharge::Engine.routes.draw do
  resources :pages, :controller => "static_charge/pages", :path => "/pages"
  root :to => "static_charge/pages#index"
end
