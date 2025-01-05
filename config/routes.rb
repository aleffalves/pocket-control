Rails.application.routes.draw do
  resources :categoria
  resources :consumidors
  resources :usuarios
  root "dashboard#index"
end
