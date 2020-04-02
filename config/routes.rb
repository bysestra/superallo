require 'sidekiq/web'

Rails.application.routes.draw do
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

  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :contacts

  namespace :account do
    resources :custom_fields
  end

  namespace :twilio do
    resource :capability, only: :create

    namespace :outgoing do
      resource :call, only: :create
    end
  end

  root to: 'contacts#index'
end
