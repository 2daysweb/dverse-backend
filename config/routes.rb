Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
    

      resources :users
      resources :jobs
      post '/login', to: 'auth#create' #needs the username and password
      get '/profile', to: 'users#show' #take in the token
    
    end 
  end 
end
