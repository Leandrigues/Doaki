Rails.application.routes.draw do
  get 'about/index'
  get 'home/index'
  root 'home#index'
  resources :donations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
