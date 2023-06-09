Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end
  get 'articles/index'
  get 'articles/show'
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
  resources :messages, only: [:new, :create]
  resources :articles, only: [:index, :new, :create]
  get '/articles/:title_param', to: 'articles#show', as: 'article'
  get '/articles/:title_param/edit', to: 'articles#edit', as: :edit_article
  patch '/articles/:id', to: "articles#update"
  delete '/articles/:id', to: "articles#destroy"
  get 'about', to: 'pages#about'
  get 'leaders', to: 'pages#leaders'
  get 'companies', to: 'pages#companies'
  get 'privacy-policy', to: 'pages#privacy_policy'
end
