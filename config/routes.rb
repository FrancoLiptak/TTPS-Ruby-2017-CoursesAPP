Rails.application.routes.draw do

  devise_for :users
  
  root 'courses#index'

  resources :courses do
    resources :evaluation_instances do
      patch 'scores/edit', to: 'scores#update', as: 'upload'
      resources :scores
    end
    
    member do
      get :summary
    end
    resources :students
  end
  
end
