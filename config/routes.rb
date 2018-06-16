

Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	
  
	
  resources :articles do
  	resources :comments
  end
	root 'articles#index'

end
