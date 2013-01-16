LexiqueCuisine::Application.routes.draw do
  get 'alphabetique' => 'public#alpha', :as => :alpha
  post 'recherche'    => 'lexiques#index', :as => :search

  resources :categories

  resources :comments

  resources :lexiques

  #devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, path: '', path_names: {sign_in: 'login', sign_out: 'logout'}

  get "public/index"
  get ":permalink" => 'categories#show', :as => :category_permalink
  get "definitions/:permalink" => 'lexiques#show', :as => :lexique_permalink

  root :to => 'public#index'
end
