Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :visits
  resources :places
  resources :trips
  resources :vehicles do 
    member do 
      get :fetch_mpg
    end
  end
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks"}
end
