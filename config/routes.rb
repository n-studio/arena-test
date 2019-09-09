Rails.application.routes.draw do
  root to: 'fights#index'
  resources :fights do
    resources :fight_steps, path: "steps", as: "steps", only: :show
  end

  namespace :admin do
    root to: 'fighters#index'
    resources :fighters, except: :show
    get 'fighters/:id', to: redirect('/admin/fighters/%{id}/edit')
  end
end
