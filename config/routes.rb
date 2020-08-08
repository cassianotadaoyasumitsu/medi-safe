Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :nurse_tasks, only: [:index] do
    collection do
      patch :sort
    end
  end
  resources :patients, only: [:index, :show]
end
