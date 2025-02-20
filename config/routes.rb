Rails.application.routes.draw do
  devise_for :users  #最初に書かないとエラーになる
  
  resources :books,except: [:new,]
  resources :users,except: [:new, :destroy]


  root 'homes#top'
end
