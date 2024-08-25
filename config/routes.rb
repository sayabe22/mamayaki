Rails.application.routes.draw do
  get 'users/mypage'
  get 'users/edit'
  get 'users/show'
  devise_for :users
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root to: "homes#top"
  get 'home/about' => 'homes#about',as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
