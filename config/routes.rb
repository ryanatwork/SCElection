SCelection::Application.routes.draw do

  resources :votes

  resources :candidates

  resources :precincts

  root :to => 'home#index'

end
