Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get 'home', to: 'home#index', as: 'add_accounts'
  post '/home/add_account', to: 'home#add_account'
  get '/auth/:provider/callback', to: 'sessions#create'
end
