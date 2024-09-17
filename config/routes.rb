Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:show, :destroy]
  end
  
  scope module: :public do
    devise_for :users
  
    devise_scope :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
    
    root to: "homes#top"
    
    get 'user/mypage' => 'users#mypage',as: :'mypage'
    resources :users do
      member do
        get :favorites
      end
      
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      
    end
    
    resources :posts do
      resource :favorite, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    
    get 'search', to: 'searches#search'
  end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
