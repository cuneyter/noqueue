Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'leave', to: 'pages#leave'
  get 'how_it_works', to: 'pages#how_it_works'

  resources :stores, only: %i[new create index show] do
    resources :customers, only: %i[new create index] do
      resources :queue_positions, only: %i[show update]
    end
  end
  resources :queue_positions, only: %i[destroy]
  delete "remove_from_store/:id", to: 'queue_positions#remove_from_store', as: :remove
end
