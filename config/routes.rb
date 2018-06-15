require "resque_web"

Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	
  
	mount ResqueWeb::Engine => "/resque_web"
  resources :articles do
  	resources :comments
  end
	root 'articles#index'

end
