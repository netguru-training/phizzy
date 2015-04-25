Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'visitors#index'
  resource :patient_profile
  #resources :therapist_profiles, :patient_profiles, only: [:show, :edit, :update, :create]
end
