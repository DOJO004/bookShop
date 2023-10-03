Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root to: 'books#index' 

  resources :books
  resources :coupon
  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end
  get 'select_role', to: 'users#select_role'
  post 'select_store', to: 'users#select_store'
  post 'select_client', to: 'users#select_client'

end
