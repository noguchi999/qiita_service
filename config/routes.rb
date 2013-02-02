QiitaService::Application.routes.draw do

  root to: 'facebook/oauths#welcome'

  namespace :facebook do
    resources :timelines do
      collection do
        post :search
      end
    end

    resources :oauths do
      collection do
        get :welcome
        get :redirect
      end
    end
  end

  resources :tomodachis
end
