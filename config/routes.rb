require 'sidekiq/web'

Rails.application.routes.draw do
  resources :contacts
  namespace :admin do
    resources :users
    resources :announcements
    resources :custom_fields

    root to: 'users#index'
  end

  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :account do
    resources :custom_fields
  end

  root to: 'home#index'
end
