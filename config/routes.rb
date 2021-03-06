Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :stores, only: %i[new create index show] do
    resources :customers, only: %i[new create] do
      resources :queue_positions, only: %i[show update destroy]
    end
  end
  resources :queue_positions, only: %i[destroy]
end
