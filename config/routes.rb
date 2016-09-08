Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles

  get '/download_all', to: 'profiles#download_all'
  get '/download_selected', to: 'profiles#download_selected'

  root to: 'profiles#index'

end
