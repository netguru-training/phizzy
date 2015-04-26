class PatientProfilesController < ApplicationController
  before_filter :check_user
  before_action :check_profile_type, :only => [:index]
  expose(:patient_profile) { current_user.decorate }
  expose(:patient) { User.find(params[:id]) }

  def index
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "exercises"   # Excluding ".pdf" extension.
      end
    end
  end

  def show
    if current_user.profilable.kind_of?(PatientProfile)
      if current_user.id.to_s != params[:id].to_s
        flash[:error] = "You cannot visit this page."
        redirect_to patient_profiles_path
      end
    end

    if patient.profilable.kind_of?(TherapistProfile)
      flash[:error] = "You can't make your therapist friends as your patients!"
      redirect_to therapist_profile_path
      return
    end

    if !patient.therapist
      flash[:error] = "This patient has not yet been therapise'd."
      redirect_to therapist_profile_path
      return
    end

    if patient.therapist.id != current_user.id
        flash[:error] = "You are not this patient's therapist!"
        redirect_to therapist_profile_path
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

  def check_profile_type
    if current_user.profilable.kind_of?(TherapistProfile) || current_user.profilable.nil?
      redirect_to therapist_profile_path
    end
  end
end

