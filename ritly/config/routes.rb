Ritly::Application.routes.draw do



  resources :urls
	
	get 'go/:random_string', to: "urls#transfer", as: 'go'
	
	get 'go/:random_string/preview', to: "urls#preview"

  root to: "urls#index"

  


end
