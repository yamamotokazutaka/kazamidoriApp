Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'forms#index'
  resources :forms, only:[:index, :create, :show]
end
