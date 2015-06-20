Rails.application.routes.draw do

  namespace :access do
  end

  resources :dev

  root 'dev#index'

end
