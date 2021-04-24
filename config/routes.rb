Rails.application.routes.draw do
  devise_for :users
  root to: "wants#index"
  resources :wants do
    resources :entries, only: [:new, :create, :show, :update, :destroy]
  end
end
