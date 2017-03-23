Rails.application.routes.draw do
  get 'home_page/index'
  resources :systems, shallow: true do
    resources :versions do
      resources :tables
    end
  end

  get 'load/index'
  get 'maintain/index'
  get 'map/index'
  get "system/version_view", to: "systems#version_view", as: "version_view"
  get "system/create_version", to: "systems#create_version", as: "create_version"
  get "system/:id", to: "systems#show2", as: "show_version"

  get "version/:id", to: "versions#show2", as: "display_version"

  get "version1/:id", to: "versions#show3", as: "display_version1"

  get "map/index", to: "map#index", as: "map_home"

  get "system1/:id", to: "systems#newShow", as: "new_version"




  root 'home_page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
