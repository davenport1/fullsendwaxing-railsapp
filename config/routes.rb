Rails.application.routes.draw do
  get "admin/home"
  resource :session
  resources :passwords, param: :token
  post "contact", to: "home#send_contact"
  get "home/index"
  get "home/about"
  get "home/contact"
  get "home/services"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"

  get "registration/new"
  get "registration/create"
  get "signup", to: "registration#new"
  post "signup", to: "registration#create"

  resources :articles do
    resources :comments
  end
end
