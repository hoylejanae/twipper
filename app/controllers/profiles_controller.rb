class ProfilesController < ApplicationController
	def new
		if current_user.profile
			redirect_to profile_path(current_user.profile)
		else

		@profile = Profile.new
	end

	end

	def create

		@profile = Profile.new(profile_params)
		@profile.user = current_user

		if @profile.save
			flash[:success] = "Profile succesfully created"

		else
			flash.now[:danger] = "Please fix the errros below"
			render 'new'

		end
		redirect_to profile_path(current_user.profile)
	end

	def show
		@profile = Profile.find(params[:id])
	end

	def profile_params

		params.require(:profile).permit(:description, :pic)
	end


end
