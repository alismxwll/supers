Rails.application.routes.draw do
  root to: 'post#index'
  resources :post
end
