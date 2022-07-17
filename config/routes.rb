Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about',as: 'about'

  devise_scope :user do
    get '/users/sign_out' => 'devise/registrations#destroy'
  end
  
  post 'books/:id' => 'books#create'
  post 'books' => 'books#create'
  resources :books
  post 'users/:id/edit' => 'users#update'
  resources :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
