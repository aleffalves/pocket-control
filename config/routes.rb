Rails.application.routes.draw do
  resources :consumidors
  resources :usuarios
  root "dashboard#index"
end
