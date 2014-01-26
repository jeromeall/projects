Ritly::Application.routes.draw do

get '/urls/all', to: "urls#show_all"

  resources :urls
	
	get 'go/:random_string', to: "urls#transfer", as: 'go'
	
	get 'go/:random_string/preview', to: "urls#preview"

  root to: "urls#index"

  

  


end
