Rails.application.routes.draw do
  devise_for :users  #最初に書かないとエラーになる
  
  resources :books,except: [:new,]
  resources :users,except: [:new, :destroy]
  get 'home/about' => 'homes#about'

  root 'homes#top'
end
