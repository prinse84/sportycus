Sportycus::Application.routes.draw do
  resources :seasons
  match '/home', to: 'static_pages#home',    via: 'get'
  root 'static_pages#home'

end
