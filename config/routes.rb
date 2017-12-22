Rails.application.routes.draw do

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
  
  devise_for :users

  authenticated :users do
    root 'courses#index', as: :authenticated_root
  end

  get 'courses/index'
  
end
