Rails.application.routes.draw do
  devise_for :users  #最初に書かないとエラーになる


  root 'homes#top'
end
