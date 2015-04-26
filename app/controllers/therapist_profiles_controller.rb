class TherapistProfilesController < ApplicationController
  before_filter :check_user

  expose(:therapist_profile) { current_user.profilable }
  expose(:patients) { UserDecorator.decorate_collection(User.where(profilable_type: 'PatientProfile')) }
  expose(:exercises) { Exercise.all }

  def show

    if current_user.profilable.kind_of?(PatientProfile) || current_user.profilable.nil?
      redirect_to patient_profiles_path(current_user.profilable)
    end

  end

  def create
    if therapist_profile.create(profile_params)
      redirect_to therapist_profile
    end
  end

  def edit
  end

  def update
    if therapist_profile.update_attributes(profile_params)
      flash[:notice] = 'Profile updated'
      redirect_to therapist_profile
    else
      render 'edit'
    end
  end

  def corelate_exercises
    flash[:notice] = "Created exercises for patients"
  	exercise_patients.each do |id|
      profile = User.find(id).profilable
      exercises_for_patients.each do |exercise_id|
        exercise = Exercise.find(exercise_id)
        unless (ExercisePatient.create({ patient_profile: profile, exercise: exercise, series_count: 1, repetitions: 1 }))
          flash[:notice] = "Error committing exercises"
        end
      end
    end

    render 'show'
  end

  def add_exercise
  	if Exercise.create(exercise_params)
  		flash[:notice] = 'Exercise created'
  	else
  		flash[:error] = 'Error creating exercise'
  	end
  	
  	render 'show'
  end

  private	
    def exercises_for_patients
      params[:exercises] 
    end

    def exercise_patients
      params[:patients]
    end

  	def exercise_params
  		params.permit(:description, :name)
  	end

    def profile_params
      params.require(:therapist_profile).permit(:address, :hours_from, :hours_to)
    end

    def check_user
      unless user_signed_in?
        flash[:notice] = 'Please log in to view the profile'
        redirect_to new_user_session_path
      end
    end
end

