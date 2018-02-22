Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [ :new, :create ]
  end
end
  # root to:'_restaurants#index'

  # resources :restaurant

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

