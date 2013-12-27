Sportycus::Application.routes.draw do
  resources :players
  resources :seasons do
    resources :games  
  end
  
  match '/home', to: 'static_pages#home',    via: 'get'
  root 'static_pages#home'

end
