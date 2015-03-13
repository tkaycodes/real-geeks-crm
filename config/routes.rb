Rails.application.routes.draw do
  devise_for :agents
  root 'leads#index'

  resources :leads, only: [:index, :show, :update] do
    resources :agents, only: [:update]
  end
  
  resource :settings, only: [:show, :update]

end
