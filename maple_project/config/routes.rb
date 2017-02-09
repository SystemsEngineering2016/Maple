Rails.application.routes.draw do
  get 'home_page/index'
  get 'systems/new'
  get 'load/new'
  get 'maintain/new'
  get 'map/new'
  #resources :systems
  root 'home_page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
