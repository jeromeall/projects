Ritly::Application.routes.draw do



get '/urls', to: "urls#show_all"

delete '/urls', to: "urls#destroy"

resources :urls, :users, :sessions

root to: "urls#index"

get "/signup", to: "users#new"

match "/signout", to: "sessions#destroy", via: :delete

get "/signin",to: "sessions#new"

get 'go/:random_string', to: "urls#transfer", as: 'go'

get 'go/:random_string/preview', to: "urls#preview", as: 'preview'
end
