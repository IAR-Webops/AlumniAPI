Rails.application.routes.draw do

  namespace :access do
  end

  resources :dev
  resources :app

  root 'dev#index'

end
