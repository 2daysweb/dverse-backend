Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      post '/login', to: 'auth#create' 
      get '/profile', to: 'users#show' 
      resources :users
      resources :jobs
    end 
  end 
end
