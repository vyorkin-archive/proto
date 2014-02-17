Proto::Application.routes.draw do
  mount API => '/api/v1'

  scope module: :web do
    get 'home/index'
    root to: 'home#index'
  end

  #namespace :admin do
  #  resources :users
  #  resources :players
  #  resources :skills
  #  resources :characteristics
  #  resources :buildings
  #  resources :items
  #end

  #namespace :api do
  #  namespace :v1 do
  #  end
  #end
end
