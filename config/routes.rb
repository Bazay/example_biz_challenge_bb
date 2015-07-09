Rails.application.routes.draw do
  get 'home/index'

  resources :orders, :only => :index, :defaults => { format: :json }
  root 'home#index'
end
