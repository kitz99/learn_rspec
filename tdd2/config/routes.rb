Rails.application.routes.draw do
  get 'status' => 'status#index'
  resources :consoles, only: [:index]
end
