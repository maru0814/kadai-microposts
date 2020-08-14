Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  resources :users, only: [:index,:create,:show] do
  member do
      get :followings
      get :followers
      get :likes
    end
  end
  get  "signup", to: "users#new" 
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
   resources :microposts, only: [:create, :destroy]
   resources :relationships, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
end
