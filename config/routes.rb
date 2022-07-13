Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admins/sessions"
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root to: "homes#top"

  namespace :admins do
    resources :works, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:destroy]
      collection do
        get 'search'
      end
    end
    resources :users, only: [:index]
  end

  scope module: :users do
    resources :works, only: [:index, :show] do
      resources :post_comments, only: [:create, :destroy]
      resource :watchlists, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end

    resources :users, only: [:show, :edit, :update] do
      member do
        get :follows, :followers
      end
      resource :relationships, only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
