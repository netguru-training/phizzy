class RegistrationsController < Devise::RegistrationsController
  def create
    super

    binding.pry
    if (params[:user][:profilable_type] == 'therapist')
      therapist_profile = TherapistProfile.new({ address: 'Please enter your address', hours_from: 'opened from', hours_to: 'opened to', user: resource })
      therapist_profile.save
      #resource.profilable = therapist_profile
    elsif (params[:user][:profilable_type] == 'patient')
      patient_profile = PatientProfile.new({user: resource})
      patient_profile.save
      #resource.profilable = patient_profile
    end
    resource.save

  end

  private

    def therapist_profile_params
      params.require(:user).permit(:address, :hours_from, :hours_to)
    end

    def patient_profile_params
      #params.require(:user).permit()
    end
end

