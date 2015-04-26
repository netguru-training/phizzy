Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'visitors#index'

  resources :patient_profiles, only: [:index, :show, :edit, :update, :create]
  resources :exercise_patient, only: [:new, :edit, :delete]
  resource :therapist_profile, only: [:show, :edit, :update, :create]
  resource :exercises


  post '/therapist_profile/corelate_exercises' => "therapist_profile#corelate_exercises"
  post '/therapist_profile/add_exercise' => "therapist_profile#add_exercise"

end
