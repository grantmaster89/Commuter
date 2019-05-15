Rails.application.routes.draw do
  
  resources :visits
  resources :places
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :users
  
  resources :trips
  resources :vehicles do 
    member do 
      get :fetch_mpg
    end
  end
end
