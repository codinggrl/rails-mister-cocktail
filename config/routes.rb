Rails.application.routes.draw do
  resources :cocktails do
    resources :doses, only: [:new, :create]
    resources :doses, only: [:destroy]
  end
end
