Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  get "home/about" => "homes#about"
  get '/search', to: 'searchs#search'
  resources :users,only: [:show,:index,:edit,:update] do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end  
  resources :books  do  
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end  
end