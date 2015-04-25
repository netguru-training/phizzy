class TherapistProfileController < ApplicationController
	before_filter :check_user

	def show
		@profile = current_user.theraphist_profile
	end

	def create
		if TheraphistProfile.create(profile_params)
			redirect_to theraphist_profile_show(@profile)
		end
	end

	def edit
		@profile = TheraphistProfile.find(params[:id])
	end

	def update
		@profile = TheraphistProfile.find(params[:id])
		if @profile.update_params(profile_params)
			flash[:notice] = 'Profile updated'
			redirect_to @profile
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
