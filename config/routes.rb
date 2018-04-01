Rails.application.routes.draw do

  #Apply devise for users
  devise_for :users

  #One > many relationship
  resources :patients do
    resources :consultations
  end

  root 'patients#index'
end
