class PatientProfilesController < ApplicationController
  before_filter :check_user
  expose(:patient_profile) { current_user }

  def index
    if current_user.profilable.kind_of?(TherapistProfile) || current_user.profilable.nil?
      redirect_to therapist_profiles_path
    end
  end

  def show
    if current_user.id != params[:id]
      flash[:error] = "You cannot visit this page."
      redirect_to patient_profiles_path
    end
  end

  def create
    if patient_profile.create(profile_params)
      redirect_to patient_profile
    end
  end

  def edit
  end

  def update
    if patient_profile.update_params(profile_params)
      flash[:notice] = 'Your profile was successfully updated.'
      redirect_to patient_profiles_path
    else
      render 'edit'
    end
  end

  private	

    def profile_params
      params.require(:patient_profile).permit(:therapist_id)
    end

    def check_user
      unless signed_in?
        flash[:notice] = 'Please log in to view the profile.'
        redirect_to new_user_session_path
      end
    end
end

