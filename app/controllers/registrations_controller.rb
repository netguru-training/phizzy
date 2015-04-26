class RegistrationsController < Devise::RegistrationsController
  expose(:therapist_profile)
  expose(:patient_profile)

  def create
    super

    if (params[:user][:profilable_type] == 'therapist')
      resource.profilable = therapist_profile
    elsif (params[:user][:profilable_type] == 'patient')
      resource.profilable = patient_profile
    end
    resource.save

  end
end

