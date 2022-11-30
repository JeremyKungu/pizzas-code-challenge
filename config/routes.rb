Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :restaurants, only:[:index, :show, :destroy]
  resources :pizzas, only:[:index]
  # Defines the root path route ("/")
  # root "articles#index"
end
