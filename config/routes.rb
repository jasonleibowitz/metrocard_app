Rails.application.routes.draw do
  resources :metrocard
  resources :home
  root to: 'home#index'
end
