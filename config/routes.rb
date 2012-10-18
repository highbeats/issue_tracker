IssueTracker::Application.routes.draw do
  resources :tickets do
    resources :comments, only: [ :index, :new, :create ]
  end

  devise_for :managers

  root to: 'main#home'
end
