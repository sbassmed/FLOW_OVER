Rails.application.routes.draw do

  root 'questions#index'

  devise_for :users
  resources :questions
  resources :comments , only: [:create]
  resources :answers , only: [:create, :destroy]#no se si :update
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
