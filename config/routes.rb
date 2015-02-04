Rails.application.routes.draw do
  devise_for :agents
  root 'leads#index'

  resources :leads, only: [:index, :show]
  resource :settings, only: [:show, :update]

end
