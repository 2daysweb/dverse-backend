Rails.application.routes.draw do
      post '/login', to: 'auth#create' 
      get '/profile', to: 'users#show' 
      resources :users
      resources :jobs
    end 
  end 
end
