Rails.application.routes.draw do
  get 'activities/index'
  mount Ckeditor::Engine => '/ckeditor'
  mount ActionCable.server => '/cable'
  root 'pages#index'		
  devise_for :users
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
  resources :books do 
    resources :posts, only: [:new, :create, :edit,:update]
    resources :chapters, only: [:show, :index]
  end  
  resources :activities
  resources :rates
  resources :posts, only: [:show, :index,:destroy] 
  resources :comments, only: [:create, :destroy, :index]
  namespace :admin do
    resources :books 
    resources :chapters
    resources :posts
  end  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
