class TherapistProfileController < ApplicationController
	before_filter :check_user
	expose(:therapist_profile)

	def show
	end

	def create
		if therapist_profile.create(profile_params)
			redirect_to therapist_profile
		end
	end

	def edit
	end

	def update
		if therapist_profile.update_params(profile_params)
			flash[:notice] = 'Profile updated'
			redirect_to therapist_profile
		else
			render 'edit'
		end
	end

	private	

		def profile_params
			params.require(:therapist_profile).permit(:address, :hours_from, :hours_to)
		end

		def check_user
			unless user_signer_in?
				flash[:notice] = 'Please log in to view the profile'
				redirect_to new_user_session_path
			end
		end
end
