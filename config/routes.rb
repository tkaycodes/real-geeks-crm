Rails.application.routes.draw do
  devise_for :agents
  root 'leads#index'

  resources :leads, only: [:index, :show, :update, :new, :create] 
  
  resource :settings, only: [:show, :update]

  #API ROUTES
  #api/v1/leads

  namespace :api, defaults:{format: :json} do
    namespace :v1 do
      resources :leads, only: [:index, :show, :create]
    end
  end


end
