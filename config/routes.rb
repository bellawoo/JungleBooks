Rails.application.routes.draw do
  root 'books#index'
  get '/books/select', to: 'books#select'
  resources :books, except: [:edit, :update]


  resources :books do
    resources :votes, except: [:edit, :update, :destroy] 
  end
  devise_for :users
end
