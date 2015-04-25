Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'

  resources :therapist_profiles, :patient_profiles, only: [:show, :edit, :update, :create]
end
