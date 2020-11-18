Rails.application.routes.draw do
  require 'sidekiq/web'
  get 'categories/index'
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_scope :user do
    authenticate :user do
     mount Sidekiq::Web => "/sidekiq"
    end
  end


  get 'restores/inex'
  get 'restores/new'
  get 'restores/show'
  get 'activities/index'
  mount Ckeditor::Engine => '/ckeditor'
  mount ActionCable.server => '/cable'
  root 'pages#index'		
  devise_for :users,controllers: { confirmations: 'confirmations' }
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
  resources :books do 
    resources :posts, only: [:new, :create, :edit,:update]
    resources :chapters, only: [:show, :index]
  end 
  resources :categories, only: :index
  resources :users 
  resources :activities
  resources :rates
  resources :posts, only: [:show, :index,:destroy] 
  resources :comments, only: [:create, :destroy, :index]
  namespace :admin do
    resources :books 
    resources :chapters
    resources :posts
    resources :restores
    resources :routers 
  end  
  get 'admin/home', to: 'admin/pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
