Rails.application.routes.draw do
  resources :lancamentos
  resources :categoria
  resources :consumidors
  resources :usuarios
  root "dashboard#index"
end
