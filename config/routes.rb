Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'books#index' 

  get 'select_role', to: 'users#select_role'
end
