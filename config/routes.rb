Exstatic::Engine.routes.draw do
  resources :pages, :controller => "pages", :path => "/pages"
  root :to => "exstatic/pages#index"
end
