Rails.application.routes.draw do

  devise_for :users
  devise_for :admins
  root to: "homes#top"

  namespace :admins do
   resouces :works, only: [:new, :create, :index, :show, :edit, :update]
  end

  namespace :users do
    resouces :works, only: [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
