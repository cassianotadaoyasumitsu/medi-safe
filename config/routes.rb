Rails.application.routes.draw do
  devise_for :users
  root to: 'patients#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :nurse_tasks, only: [:index] do
    collection do
      patch :sort, :complete
    end
  end
  resources :patients, only: [:index, :show]
  resources :users, path: :nurses, only: [:index, :show]
end

