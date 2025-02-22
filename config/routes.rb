Rails.application.routes.draw do
  devise_for :users
  
  resources :users, except: [:new, :destroy, :create] 
  resources :books, except: [:new]  
  
  get 'home/about' => 'homes#about', as:'about'

  root 'homes#top'
end
