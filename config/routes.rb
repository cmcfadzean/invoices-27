Rails.application.routes.draw do
  resources :invoices do
    member do
      get :preview
    end 
    resources :items
  end
  resources :clients
  devise_for :users
  get "home", to: "home#index"
  root 'clients#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
