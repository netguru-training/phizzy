Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'visitors#index'

  resources :patient_profiles, only: [:index, :show, :edit, :update, :create]
  resources :exercise_patient, only: [:new, :edit, :delete]
  resource :therapist_profile, only: [:show, :edit, :update, :create]
  resource :exercises
end
