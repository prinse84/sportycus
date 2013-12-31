Sportycus::Application.routes.draw do
  get "boxes/new"
  resources :players
  resources :seasons do
    resources :games do
      resources :boxes
    end
  end
  
  match '/home', to: 'static_pages#home',    via: 'get'
  root 'static_pages#home'

end
