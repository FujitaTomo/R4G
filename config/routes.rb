Rails.application.routes.draw do

  get 'comments/create'

  get 'comments/destroy'

  get 'boards/index'

  get 'boards/create'

  get 'boards/show'

  get 'boards/destroy'

  devise_for :users
  devise_for :admins

  root 'tops#top'

  get 'admins/top'

  get "genres/:id/items/ranking" => "genres#ranking", as:"genre_items_ranking"
  get "genres/:id/items/monthrank" => "genres#monthrank", as:"genre_items_monthranking"
  get "genres/:id/items/nextmonthrank" => "genres#nextmonthrank", as:"genre_items_nextmonthranking"
  get "genres/:id/items/prevmonthrank" => "genres#prevmonthrank", as:"genre_items_prevmonthranking"  

  get "hardwares/:id/items/ranking" => "hardwares#ranking", as:"hardware_items_ranking"
  get "hardwares/:id/items/monthrank" => "hardwares#monthrank", as:"hardware_items_monthranking"
  get "hardwares/:id/items/nextmonthrank" => "hardwares#nextrank", as:"hardware_items_nextmonthranking"
  get "hardwares/:id/items/prevmonthrank" => "hardwares#prevrank", as:"hardware_items_prevmonthranking"

  get "items/ranking" => "items#ranking", as: "items_ranking"
  get "items/monthrank" => "items#monthrank", as:"items_monthranking"
  get "items/nextmonthrank" => "items#nextmonthrank", as:"items_nextmonthranking"
  get "items/prevmonthrank" => "items#prevmonthrank", as:"items_prevmonthranking"
  get "items/newrelease" => "items#newrelease",as:"items_newrelease"

  resources :users ,only:[:show,:index,:destroy]

  resources :items do
    resources :votes,only: [:create,:destroy,:new]
  end

  scope :admin do
    resources :hardwares, only: [:create,:destroy, :index]
    resources :ratings, only: [:create,:destroy, :index]
    resources :genres, only: [:create,:destroy, :index]
    resources :labels, only: [:create,:destroy, :index]
    resources :votes, only:[:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
