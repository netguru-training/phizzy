class PatientProfileController < ApplicationController
	before_filter :check_user

	def show
		@profile = current_user.patient_profile
	end

	def create
		if PatientProfile.create(profile_params)
			redirect_to @profile
		end
	end

	def edit
		@profile = PatientProfile.find(params[:id])
	end

	def update
		@profile = PatientProfile.find(params[:id])
		if @profile.update_params(profile_params)
			flash[:notice] = 'Profile updated'
			redirect_to @profile
		else
			render 'edit'
		end
	end

	private	

		def profile_params
			params.require(:patient_profile).permit(:theraist_id)
		end

		def check_user
			unless user_signer_in?
				flash[:notice] = 'Please log in to view the profile'
				redirect_to new_user_session_path
			end
		end
end