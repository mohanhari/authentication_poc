Rails.application.routes.draw do
  root 'users#status'

  resource :sessions, only: [:create]

  resources :users, only: [:create] do
    member do
      patch :create_password
      get :new_password
    end
    collection do
      get :verify_email
      get :email_verified
    end
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
