Rails.application.routes.draw do
	
  root 'static_pages#home'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/faq'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
