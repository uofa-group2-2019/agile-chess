Rails.application.routes.draw do
  resources :games, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
end
