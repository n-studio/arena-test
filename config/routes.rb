Rails.application.routes.draw do
  root to: 'arenas#index'

  namespace :admin do
    root to: 'fighters#index'
    resources :fighters
  end
end
