Proto::Application.routes.draw do
  mount API => '/api/v1'

  scope module: :web do
    get 'home/index'
    root to: 'home#index'
  end
end
