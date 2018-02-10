Rails.application.routes.draw do
  # Forum
  resources :messages, :only => [:index]
  
  # Auth
  get '/login' => 'home#show'
  get "/auth/oauth2/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles

  get '/download_all', to: 'profiles#download_all'
  get '/download_selected', to: 'profiles#download_selected'
  get '/combined_selected', to: 'profiles#combined_selected'
  get '/destroy_selected', to: 'profiles#destroy_selected'

  get "/pages/:page" => "pages#show"

  root :to => "pages#show"

end
