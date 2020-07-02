Rails.application.routes.draw do
    resources :users, only: [:new, :create]
    resources :voters, only: [:new, :create, :edit, :update, :index]
    get 'calls', to:'calls#index', as: :calls
    get 'welcome/index'

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'welcome', to: 'welcome#index'

    get 'nextcall', to: 'calls#nextcall'

    get 'reset_calling_voters', to:'voters#reset_calling_voters'


    root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
