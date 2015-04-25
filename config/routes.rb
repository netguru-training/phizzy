Rails.application.routes.draw do

  get 'exercise/new'

  get 'exercise/edit'

  get 'exercise/delete'

  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'visitors#index'
  resource :patient_profile, only: [:show, :edit, :update, :create]
  resources :exercise_patient, only: [:new, :edit, :delete]
  resources :exercise, only: [:new, :edit, :delete]
  resource :therapist_profile, only: [:show, :edit, :update, :create]
end
