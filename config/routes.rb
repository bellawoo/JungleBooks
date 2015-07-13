Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  get '/books/select', to: 'books#select'
  resources :books, except: [:edit, :update]
  resources :votes, except: [:edit, :update, :destroy] 
end
