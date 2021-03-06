Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :stores, except: %i[new create index show] do
    resources :customers, only: %i[new create] do
      resources :queue_positions, only: %i[new create show update destroy]
    end
  end
  resources :queue_positions, only: %i[destroy]
end
