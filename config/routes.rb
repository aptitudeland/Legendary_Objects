Rails.application.routes.draw do
  devise_for :users
  root to: "legends#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :legends, only: %i[index show new create destroy]
  resources :reservations do
    member do
      patch :update_status
    end
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
