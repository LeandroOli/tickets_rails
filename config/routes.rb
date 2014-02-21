Tickets::Application.routes.draw do
  get 'signin', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:create]
  resources :companies, only: [:new, :create]
  get '', to:  'dashboard#index', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }, as: 'dashboard_index'
  root "pages#index"

  namespace :admin do
    root 'pages#index'
  end


end
