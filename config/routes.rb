Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :stores, except: %i[index] do
    resources :customers, only: %i[new create] do
      resources :queue_positions, only: %i[show update]
    end
  end
  resources :queue_positions, only: %i[destroy]
end
