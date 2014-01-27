Ritly::Application.routes.draw do

  
get '/urls', to: "urls#show_all"



root to: "urls#index"

delete '/urls', to: "urls#destroy"

  resources :urls

	
	get 'go/:random_string', to: "urls#transfer", as: 'go'
	
	get 'go/:random_string/preview', to: "urls#preview", as: 'preview'

  	

	
  


end
