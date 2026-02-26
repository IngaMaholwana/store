Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resource :sign_up
  root "products#index"
  resources :products do
    resources :subscribers, only: [ :create ]
  end
  resource :unsubscribe, only: [ :show ]
end
