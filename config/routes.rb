Rails.application.routes.draw do
  devise_for :users

  resources :questions, except: [:edit, :update, :destroy] do
    resources :comments, only: [:create]
    resources :votes, only: [:create, :destroy]
    resources :answers, only: [:create]
  end

  root "questions#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
