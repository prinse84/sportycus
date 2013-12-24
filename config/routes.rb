Sportycus::Application.routes.draw do
  root 'static_pages#home'
  match '/home', to: 'static_pages#home',    via: 'get'
  resources :seasons
  

end
