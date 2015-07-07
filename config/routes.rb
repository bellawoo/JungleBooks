Rails.application.routes.draw do
  root 'books#index'
  resources :books do
    resources :votes, except: [:update, :destroy] 
  end
  devise_for :users
end
