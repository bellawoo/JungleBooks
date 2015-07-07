Rails.application.routes.draw do
  root 'books#index'

  resources :books, except: [:edit, :update]

  resources :books do
    resources :votes, except: [:edit, :update, :destroy] 
  end
  devise_for :users
end
