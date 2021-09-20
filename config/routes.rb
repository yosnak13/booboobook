Rails.application.routes.draw do
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

  resources :users, except: [:index] do
    member do
      get "character_select", to: "character_selects#new"
      post "character_select", to: "character_selects#create"
    end
    resources :characters
  end
end
