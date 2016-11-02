Rails.application.routes.draw do
  resources :events
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  resources :users do
    resources :profiles
  end
  resources :galleries do
    resources :pictures
  end
  resources :records
  
end
