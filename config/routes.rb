IssueTracker::Application.routes.draw do
  resources :tickets

  devise_for :managers

  root to: 'main#home'
end
