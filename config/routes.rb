# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'

  namespace :api do
    namespace :v1 do
      resources :customers
      resources :users
      post 'user_token' => 'user_token#create'
    end
  end
end
