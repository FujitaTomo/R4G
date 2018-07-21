Rails.application.routes.draw do

  devise_for :users
  devise_for :admins

  root 'tops#top'
  get 'admins/top'
  get "items/ranking" => "items#ranking", as: "ranking"
  get "genres/:id/items/ranking" => "genres#ranking", as:"genre_items_ranking"
  get "hardwares/:id/items/ranking" => "hardwares#ranking", as:"hardware_items_ranking"

  resources :users  ,only:[:show,:index,:destroy]

  resources :items do
    resources :votes,only: [:create,:destroy,:new]
  end

  scope :admin do
    resources :hardwares, only: [:create,:destroy, :index]
    resources :ratings, only: [:create,:destroy, :index]
    resources :genres, only: [:create,:destroy, :index]
    resources :labels, only: [:create,:destroy, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
