Rails.application.routes.draw do
  get 'audience_services/index'
  get 'partner_services/index'
  get 'audiences/index'
  get 'partners/index'
  get 'services/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :services, only: [:index]
  resources :audiences, only: [:index]
  resources :partners, only: [:index]
  resources :partner_services, only: [:index]
  resources :audience_services, only: [:index]
end
