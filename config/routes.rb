Rails.application.routes.draw do

  devise_for :users
  resources :commands, only: [:index, :update]
  scope module: :strip do 
		resources :strips
	end
	
	root to: 'commands#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
