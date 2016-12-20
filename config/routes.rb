Rails.application.routes.draw do
  scope module: :v1 do
    resources :agencies, only: [:index, :show]
    resources :routes, only: [:index]
  end
end
