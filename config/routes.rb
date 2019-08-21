Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      post '/login/', to: 'auth#create' #needs the username and password
      get '/profile', to: 'users#show' #take in the token
      resources :users
      resources :jobs
    
    
    end 
  end 
end
