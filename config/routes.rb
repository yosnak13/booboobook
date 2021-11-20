Rails.application.routes.draw do
  get 'top', to: "users#top"
  put '/users/:id/hide' => "users#hide", as: 'users_hide'

  devise_for :admins, :controllers=> {
    sessions: "admins/sessions"
  }

  namespace :admins do
    get "users/index" => "users#index"
    get "users/:id" => "users#show", as: "user"
    delete "users/:id" => "users#destroy", as: "user_destroy"
  end

  devise_for :users, :controllers => {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations",
    unlocks: "users/unlocks",
  }

  devise_scope :user do
    root :to => "users#top"
    get "signup", to: "users/registrations#new"
    get "verify", to: "users/registrations#verify"
    get "login", to: "users/sessions#new"
    get "logout", to: "users/sessions#destroy"
  end

  resources :users, except: [:new, :create] do
    member do
      get "first_registration", to: "first_registrations#new"
      post "first_registration", to: "first_registrations#create"
      get "help", to: "users#help"
      get "study_times", to: "study_times#new"
      post "study_times", to: "study_times#create"
    end
    resources :characters
    resources :books
  end
end
