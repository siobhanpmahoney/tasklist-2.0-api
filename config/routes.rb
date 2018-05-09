Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      resources :users, param: :username
      resources :pages
      resources :tags

      resources :tasks do
        resources :status_details
      end

      post '/login', to: 'auth#login'
      get '/current_user', to: 'auth#currentUser'
      post '/signup', to: 'auth#signup'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
