Rails.application.routes.draw do
  root  "products#login"
  devise_for :users
  
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

#進度: 完成了 devise 但不知道怎完成的 哈哈哈....QQ