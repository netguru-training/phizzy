class PatientProfileController < ApplicationController
	before_filter :check_user
  expose(:patient_profile)

	def show
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
			flash[:notice] = 'Profile updated'
			redirect_to patient_profile
		else
			render 'edit'
		end
	end

	private	

		def profile_params
			params.require(:patient_profile).permit(:therapist_id)
		end

		def check_user
			unless user_signer_in?
				flash[:notice] = 'Please log in to view the profile'
				redirect_to new_user_session_path
			end
		end
end