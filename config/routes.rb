Rails.application.routes.draw do
  scope module: :v1 do
    resources :agencies, only: [:index, :show]
    resources :routes, only: [:show]
    resources :trips, only: [:show]
    resources :stop_times, only: [:show]
  end
end
