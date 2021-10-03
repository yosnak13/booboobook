Rails.application.routes.draw do
  get 'top', to: "users#top"

  devise_for :admins, :controllers=> {
    sessions: "admins/sessions"
  }

  namespace :admins do
    get 'users/index' => 'users#index'
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
      # get "reading_books", to: "reading_books#new"
      # post "reading_books", to: "reading_books#create"
    end
    resources :characters
    resources :books do
      member do
        get "reading_books", to: "reading_books#new"
        post "reading_books", to: "reading_books#create"
      end
    end
  end
end
