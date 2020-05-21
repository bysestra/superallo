require "sidekiq/web"

Rails.application.routes.draw do
  get "/privacy", to: "home#privacy"
  get "/terms", to: "home#terms"

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => "/sidekiq"

    namespace :admin do
      resources :surveys
      resources :accounts
      resources :users
      resources :custom_fields
  
      root to: "users#index"
    end
  end

  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  concern :recordable do |options|
    resource :recording, only: :create, module: options[:module]
  end

  resources :contacts do
    resources :calls, except: %i[new edit destroy], shallow: true do
      concerns :recordable, module: :call
    end
  end

  resource :today, only: :show, controller: :today

  resources :comments

  namespace :account do
    resources :custom_fields
  end

  namespace :twilio do
    resource :capability, only: :create
    
    resources :calls, only: [] do
      resources :events, only: :create
    end

    namespace :outgoing do
      resource :call, only: %i[ create ]
    end
  end

  root to: "contacts#index"
end
