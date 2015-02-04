Rails.application.routes.draw do
  devise_for :agents
  root 'leads#index'

  resources :leads, only: [:index]
  resource :settings, only: [:show, :update]

end
