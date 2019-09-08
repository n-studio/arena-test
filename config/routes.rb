Rails.application.routes.draw do
  root to: 'fights#index'
  resources :fights, except: :destroy do
    resources :fight_steps, path: "steps", as: "steps", only: :show
  end

  namespace :admin do
    root to: 'fighters#index'
    resources :fighters
  end
end
