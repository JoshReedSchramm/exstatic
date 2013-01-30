Exstatic::Engine.routes.draw do
  resources :pages, :controller => "exstatic/pages", :path => "/pages"
  root :to => "exstatic/pages#index"
end
