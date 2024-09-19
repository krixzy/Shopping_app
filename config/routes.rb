Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "index#index"



  resources :lists do 
    resources :sublists, only: [:create, :destroy, :update, :new]
  end
  resources :items, only: [:create, :destroy, :update, :new]
  resources :lists
  get "login" => "login#login", as: :login
  post "check_login" => "login#check_login", as: :check_login
  get "create" => "login#create", as: :create_account
  post "new" => "login#new", as: :new_account
end
