Rails.application.routes.draw do
  # get "tags/show"
  # get "users/edit"
  # get "users/update"
  # get "projects/index"
  # get "projects/show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "projects#index"
  resources :projects do
    resources :tasks do
      member do
        patch :update_status
      end
    end
    resources :comments, only: [ :create ]
    resources :assignments, only: [ :create, :destroy ]
  end

  devise_for :users, skip: [ :edit, :update ]

  resources :tasks do
    resources :comments, only: [ :create ]
  end
  resources :tags, only: [ :show]
  resources :users, only: [ :edit, :update ]
  get 'users/:id/dashboard', to: 'users#dashboard', as: :user_dashboard
  get 'users/:id', to: 'users#dashboard'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
