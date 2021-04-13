Rails.application.routes.draw do
  devise_for :users
  root to: "wants#index"
  resources :wants, only: [:new, :create, :show, :edit, :update, :destroy]
end
