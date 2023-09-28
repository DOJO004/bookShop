Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root to: 'books#index' 

  get 'select_role', to: 'users#select_role'
  post 'select_store', to: 'users#select_store'
  post 'select_client', to: 'users#select_client'

end
