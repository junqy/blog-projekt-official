Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "home#index"
  get 'search', to: "posts#search"
  resources :blogs do
    resources :posts do
      resources :comments
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

