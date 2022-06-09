Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  root to: "homes#top"

  namespace :admins do
   resources :works, only: [:new, :create, :index, :show, :edit, :update]
  end

  namespace :users do
    resources :works, only: [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
