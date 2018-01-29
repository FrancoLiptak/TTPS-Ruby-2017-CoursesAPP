Rails.application.routes.draw do

  devise_for :users
  
  authenticated :user do
    root 'courses#index', as: :authenticated_root
  end

  root to: redirect('/users/sign_in')

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
