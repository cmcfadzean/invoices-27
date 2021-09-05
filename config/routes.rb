Rails.application.routes.draw do
  resources :invoices do
    resources :items
  end
  resources :clients
  devise_for :users
  root 'clients#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
