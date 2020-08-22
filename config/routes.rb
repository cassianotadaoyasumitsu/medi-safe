Rails.application.routes.draw do
  devise_for :users
  root to: 'patients#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :nurse_tasks, only: [:index, :update] do
    collection do
      patch :sort, :complete
    end
  end
  patch 'nurse_tasks/make_active/:id', to: "nurse_tasks#make_active", as: "make_active_nurse_task"
  resources :patients, only: [:index, :show]
  get 'patient_assignment', to: 'patients#patient_assignment'
  post 'create_patient_assignment', to: 'patients#create_patient_assignment'
  post 'update_patient_assignment', to: 'patients#create_patient_assignment'

  resources :users, path: :nurses, only: [:index, :show]
  post 'help', to: 'users#help'

  resources :notifications do
    collection do
      patch :mark_as_read
    end
  end
end

