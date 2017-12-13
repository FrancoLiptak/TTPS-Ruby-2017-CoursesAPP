Rails.application.routes.draw do


  resources :evaluation_instances do
    resources :scores
  end
  resources :courses do
    resources :evaluation_instances do
      resources :scores
    end
  
    resources :students
  end
  
  devise_for :users
  get 'courses/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "courses#index"
end
