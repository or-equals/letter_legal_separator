Rails.application.routes.draw do
  resources :uploads, only: [:new, :create, :show]
  root to: 'pages#index'
end
