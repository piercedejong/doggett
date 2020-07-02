Rails.application.routes.draw do
    resources :users, only: [:new, :create]
    resources :voters, only: [:new, :create, :edit, :update]
    get 'calls', to:'calls#index', as: :calls
    get 'welcome/index'

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'welcome', to: 'welcome#index'


    root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
