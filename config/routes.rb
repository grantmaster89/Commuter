Rails.application.routes.draw do
  root 'maps#show'
  get '/maps' => 'maps#show'
  
  resources :places
  resources :trips

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks"}
end
