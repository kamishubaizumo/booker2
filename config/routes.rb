Rails.application.routes.draw do


  devise_for :users
  root to: 'homes#top'

  get "home/about" => "homes#about", as: "about"



  resources :books, only: [:new, :index, :create,:show, :update, :edit, :destroy]

  resources :users, only: [:index, :show, :edit, :create, :update, :destroy]


  end
