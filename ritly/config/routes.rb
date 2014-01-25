Ritly::Application.routes.draw do



  resources :urls
	
	get 'go/:random_string', to: "urls#transfer"
	
	get 'go/:random_string/preview', to: "urls#show"

  root to: "urls#index"

  


end
