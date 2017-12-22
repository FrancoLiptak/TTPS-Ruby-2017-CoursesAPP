Rails.application.routes.draw do


  resources :evaluation_instances do
    resources :scores
  end
  resources :courses do
    resources :evaluation_instances do
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
  
end
