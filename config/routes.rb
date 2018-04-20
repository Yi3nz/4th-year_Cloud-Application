Rails.application.routes.draw do

  #Reference https://www.youtube.com/watch?v=Z9GaNNztcZk
  #Apply devise for users
  devise_for :users

  resources :searches
  #One-to-many relationship patient > consultation
  resources :patients do
    resources :consultations
    #Reference https://www.youtube.com/watch?v=e3eXuvBQums&index=2&list=PLkBs-_aaZBzhzVSV-vHc-iHAfQFcqWUUx&t=314s
    #For filtering defined in patient.rb
    #Create routes patients/recent, patients/dangerous, patient/well
    collection do
      get :recent
      get :dangerous
      get :well
    end
  end

  root 'patients#index'
end
