Rails.application.routes.draw do
  root 'welcome#index'

  get 'auth/oauth2/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'logout' => 'logout#logout'
end
