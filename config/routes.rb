Rails.application.routes.draw do
  resources :products do
  	member do
  		post :checkout
  	end
  end

  resource :cart,only: [:show,:destroy] do 
  	collection do
  		post :add , path: "add/:id"
  	end
  end

end
