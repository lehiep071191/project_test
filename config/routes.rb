Rails.application.routes.draw do
  get 'activities/index'
  mount Ckeditor::Engine => '/ckeditor'
  root 'pages#index'		
  devise_for :users
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
  resources :books do 
    resources :posts, only: [:new, :create, :edit,:update]
  end  
  resources :activities
  resources :rates
  resources :posts, only: [:show, :index,:destroy] 
  resources :comments, only: [:create, :destroy]
  namespace :admin do
    resources :books
    resources :posts
  end  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
