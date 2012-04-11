SCelection::Application.routes.draw do

  devise_for :users, :skip => :registrations

  resources :votes

  resources :candidates

  resources :precincts

  root :to => 'home#index'

end
