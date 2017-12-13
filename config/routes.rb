Rails.application.routes.draw do

  resources :courses do
    resources :students
  end
  resources :courses do
    resources :evaluation_instances
  end
  
  devise_for :users
  get 'courses/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "courses#index"
end
