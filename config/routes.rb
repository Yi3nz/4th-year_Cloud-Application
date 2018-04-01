Rails.application.routes.draw do
  devise_for :users
  #get 'welcome/index'
  resources :patients do
    resources :consultations
  end

  root 'welcome#index'
end
