Rails.application.routes.draw do
  resources :line_items
  resources :bills
  resources :products
  resources :services
  resources :clients
end
