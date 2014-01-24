Ritly::Application.routes.draw do

  resources :urls

  root to: "urls#index"

  # post "/urls", to: "urls#create"  

  

end
