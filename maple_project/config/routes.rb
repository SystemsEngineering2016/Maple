Rails.application.routes.draw do
  get 'home_page/index'
  resources :systems  do
    resources :versions
  end
  get 'load/index'
  get 'maintain/index'
  get 'map/index'
  get "system/version_view", to: "systems#version_view", as: "version_view"
  get "system/create_version", to: "systems#create_version", as: "create_version"

  root 'home_page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
