Proto::Application.routes.draw do
  mount API => '/api/v1'

  scope module: :game do
    get 'home/index'
    root to: 'home#index'
  end

  namespace :admin do
    get 'home/index'
    root to: 'home#index'
  end

  namespace :map_editor do
    get 'home/index'
    root to: 'home#index'
  end
end
