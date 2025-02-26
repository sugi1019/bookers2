Rails.application.routes.draw do
  devise_for :users
  
  resources :users, except: [:new, :destroy, :create]

  resources :books, except: [:new] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  get 'home/about' => 'homes#about', as:'about'

  root 'homes#top'
end
