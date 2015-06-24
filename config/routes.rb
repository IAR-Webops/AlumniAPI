Rails.application.routes.draw do

    match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
    match '/signout', to: 'sessions#destroy', via: [:get, :post]

    namespace :access do
    end

    resources :dev
    resources :app

    root 'dev#dashboard'

end
