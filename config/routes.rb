Rails.application.routes.draw do
  resources :assemblies
  resources :parts
  resources :accounts
  resources :providers
  resources :books
  resources :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "parts#index"
end
