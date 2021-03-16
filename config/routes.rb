Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'leave', to: 'pages#leave'

  resources :stores, only: %i[new create index show] do
    resources :customers, only: %i[new create index] do
      resources :queue_positions, only: %i[show update]
    end
  end
  resources :queue_positions, only: %i[destroy]
end
