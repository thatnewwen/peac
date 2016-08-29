class ProfilesController < ApplicationController
	def index
		@profiles = Profile.order("created_at")
	end

	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.new(profile_params)
		if @profile.save
			flash[:success] = "The profile was added!"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def destroy
	  @profile = Profile.find(params[:id])
	  @profile.destroy
	  flash[:success] = "The profile was destroyed."
	  redirect_to root_path
	end

	private

	def profile_params
		params.require(:profile).permit(:resume, :first_name, :last_name, :university, :graduation_year, :company, :location, :gender, :start_date)
	end
end