Rails.application.routes.draw do
  namespace :api do 
      post '/login', to: 'auth#create' 
      get '/profile', to: 'users#show' 
      resources :users
      resources :jobs 
  end 
end
