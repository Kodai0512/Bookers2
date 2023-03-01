Rails.application.routes.draw do
   root to: 'homes#top'
  get '/home/about' => 'homes#about'
    devise_for :users
    #get '/url部分’ => 'コントローラー名#アクション名'
   resources :books,expect: [:new]
   resources :users, only: [:new, :index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
