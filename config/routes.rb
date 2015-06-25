Rails.application.routes.draw do

    match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
    match '/signout', to: 'sessions#destroy', via: [:get, :post]
    get '/dashboard', to: 'devs#dashboard', via: [:get]
    get '/terms', to: 'static#terms'

    namespace :access do
    end

    resources :devs
    resources :apps
    match '/create_app', to: 'apps#create', via: [:post]

    root 'static#home'

end
