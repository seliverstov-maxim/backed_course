Rails.application.routes.draw do
  root "web/articles#index"
  scope module: :web do
    resources :articles, only: %i[index show]
  end
end
