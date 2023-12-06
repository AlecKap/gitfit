Rails.application.routes.draw do
  root "welcome#index"

  resources :movements, only: [:new, :create, :index, :destroy]
end
