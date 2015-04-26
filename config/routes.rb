Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'visitors#index'

  resources :patient_profiles, only: [:index, :show, :edit, :update, :create]
  resources :exercise_patient, only: [:new, :edit, :delete]
  resource :therapist_profile, only: [:show, :edit, :update, :create]
  resource :exercises

  get '/about' => 'visitors#about'
  get '/contact' => 'visitors#contact'

  post '/therapist_profile/corelate_excercises' => "therapist_profiles#corelate_exercises"
  post '/therapist_profile/add_exercise' => "therapist_profiles#add_exercise"

end
