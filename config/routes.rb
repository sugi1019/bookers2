Rails.application.routes.draw do
  devise_for :users
  
  resources :books,except: [:new,]
  resources :users,except: [:new, :destroy, :create]
  get 'home/about' => 'homes#about', as:'about'

  root 'homes#top'
end
