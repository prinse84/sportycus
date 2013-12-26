Sportycus::Application.routes.draw do
  get "games/new"
  resources :seasons do
    resources :games  
  end
  
  match '/home', to: 'static_pages#home',    via: 'get'
  root 'static_pages#home'

end
