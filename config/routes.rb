Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resource :sign_up
  root "products#index"

  resources :products do
    resources :wishlist, only: [ :create ], module: :products
    resources :subscribers, only: [ :create ]
  end
  resource :unsubscribe, only: [ :show ]
  namespace :settings do
    resource :email, only: [ :show, :update ]
    resource :password, only: [ :show, :update ]
    resource :profile, only: [ :show, :update ]
    resource :user, only: [ :show, :destroy ]


    root to: redirect("/settings/profile")
  end
  namespace :email do
    resources :confirmations, param: :token, only: [ :show ]
  end
  
  namespace :store do
    resources :products
    resources :users

    root to: redirect("/store/products")
  end

end
