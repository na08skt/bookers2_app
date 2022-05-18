Rails.application.routes.draw do
  devise_for :users
  get 'homes/about', as: 'about'
  get 'homes/home', as: 'home'
  root to: 'homes#top'
  resources :users, only: [:index, :edit, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
