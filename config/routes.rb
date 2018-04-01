Rails.application.routes.draw do
  #get 'welcome/index'
  resources :patients do
    resources :consultations
  end

  root 'welcome#index'
end
