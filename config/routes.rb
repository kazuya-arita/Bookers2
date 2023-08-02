Rails.application.routes.draw do
  devise_for :users
  
  resources :books, only: [:index, :show, :edit, :update, :destroy]
  resources :users, only: [:create, :index, :show, :edit, :update]
  
  root to: 'homes#top'
  get 'about' => 'homes#about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
