Rails.application.routes.draw do
  root "web/articles#index"
  scope module: :web do
    resources :articles, only: %i[index show] do
      resources :reactions, only: %i[create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :articles, only: %i[index]
      resources :token, only: %i[create]
    end
  end
end
