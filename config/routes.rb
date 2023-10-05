Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root to: 'books#index' 

  resources :books
  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end
  resources :coupon
  get ':name/coupon', to: 'coupon#show'
  get 'select_coupon', to: 'users#select_coupon'
  post 'apply_coupon', to: 'carts#apply_coupon'
  post 'cancle_cooupon', to: 'carts#cancle_coupon'
  post 'create_order', to: 'carts#create_order'
end
