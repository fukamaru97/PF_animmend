Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admins/sessions"
  }

  root to: "homes#top"

  namespace :admins do
   resources :works, only: [:new, :create, :index, :show, :edit, :update, :destroy]
   resources :genres, only: [:create, :index, :edit, :update, :destroy]
  end

  namespace :users do
    resources :works, only: [:index, :show, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
