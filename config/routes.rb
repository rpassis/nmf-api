Rails.application.routes.draw do
  scope module: :v1 do
    resources :agencies, only: [:index, :show] do
      resources :routes, only: [:index]
    end
    resources :routes, only: [:index, :show] do
      resources :trips, only: [:index]
    end
    resources :trips, only: [:show] do
      resources :stop_times, only: [:index]
    end
    resources :stop_times, only: [:show]
  end
end
