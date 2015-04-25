class RegistrationsController < Devise::RegistrationsController
  expose(:therapist_profile)
  expose(:patient_profile)

  def create
    super

    if (params[:user][:profilable_type] == 'therapist')
      therapist_profile.user = resource
      therapist_profile.save
      resource.profilable_id = therapist_profile.id
      resource.profilable_type = 'therapist'
      binding.pry
    elsif (params[:user][:profilable_type] == 'patient')
      patient_profile.user = resource
      patient_profile.save
      resource.profilable_id = patient_profile.id
      resource.profilable_type = 'patient'
    end

    resource.save
  end
end