Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'dashboards#index'

  devise_scope :user do
    resources :users
  end

  resources :companies

  resources :productions
end
