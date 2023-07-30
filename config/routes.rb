Rails.application.routes.draw do
  devise_for :users
  
  resources :books
  resources :users, only: [:indes, :show, :edit, :update]
  
  root to: 'homes#top'
  get 'about' => 'homes#about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
