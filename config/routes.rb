Rails.application.routes.draw do
  devise_for :users
  get 'home/about', as: 'about'
  get 'home/home', as: 'home'
  root to: 'home#top'
  resources :users, only: [:index, :edit, :update, :show]
  resources :books, only: [:new, :index, :create, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
