Rails.application.routes.draw do

  #Reference https://www.youtube.com/watch?v=Z9GaNNztcZk
  #Apply devise for users
  devise_for :users

  #One > many relationship
  resources :patients do
    collection do
      get :recent
      get :dangerous
      get :well
    end
    resources :consultations
  end

  root 'patients#index'
end
