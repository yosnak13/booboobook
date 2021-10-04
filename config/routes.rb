Rails.application.routes.draw do
  devise_for :admins, :controllers=> {
    sessions: "admins/sessions"
  }

  namespace :admins do
    get "users/index" => "users#index"
  end

  devise_for :users, :controllers => {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations",
    unlocks: "users/unlocks",
  }

  devise_scope :user do
    root :to => "users/sessions#new"
    get "signup", to: "users/registrations#new"
    get "verify", to: "users/registrations#verify"
    get "login", to: "users/sessions#new"
    get "logout", to: "users/sessions#destroy"
  end

  resources :users, except: [:new, :create] do
    member do
      get "character_select", to: "character_selects#new"
      post "character_select", to: "character_selects#create"
      get "help", to: "users#help"
      get "study_times", to: "study_times#new"
      post "study_times", to: "study_times#create"
    end
    resources :characters
    resources :books
  end


end
