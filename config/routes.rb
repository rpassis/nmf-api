Rails.application.routes.draw do
  scope module: :v1 do
    resources :agencies, only: [:index]
  end
end
