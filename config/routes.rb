Rails.application.routes.draw do
  devise_for :users
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"

  get '/index', to: 'pages#index'
  resources :tags, only: [:new, :create]
  resources :tweets do
    resources :tags, only: [:new, :create, :edit, :update]
  end

end
