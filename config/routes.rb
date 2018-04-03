Rails.application.routes.draw do

  #Reference https://www.youtube.com/watch?v=Z9GaNNztcZk
  #Apply devise for users
  devise_for :users

  #One > many relationship
  resources :patients do
    resources :consultations
    collection do
      get :recent
      get :dangerous
      get :well
    end
  end

  root 'patients#index'
end
