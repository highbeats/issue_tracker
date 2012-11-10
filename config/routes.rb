IssueTracker::Application.routes.draw do

  resources :projects
  resources :time_trackings, only: [ :show, :index ]
  resources :tasks do
    resources :time_trackings, only: [ :create, :destroy ]
  end

  devise_for :managers

  root to: 'tasks#index'
end
