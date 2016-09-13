class ProfilesController < ApplicationController


	def index
		@profiles = Profile.order("created_at")
	end

	def new
		@profile = Profile.new
	end

	def create
		p params
		@profile = Profile.new(profile_params)
		if @profile.save
			flash[:success] = "The profile was added!"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
	end

	def destroy
	  @profile = Profile.find(params[:id])
	  @profile.destroy
	  flash[:success] = "The profile was destroyed."
	  redirect_to root_path
	end

	def download_all
		@profiles = Profile.order("created_at")

		@pdf = CombinePDF.new
		@profiles.each do |profile|
			url = profile.resume.url
			suburl = url[/[^?]+/]
			@pdf << CombinePDF.load("#{Rails.root}/public" + suburl)
		end
		@pdf.save "#{Rails.root}/combined.pdf"
		send_data @pdf.to_pdf, filename: "combined.pdf", type: "application/pdf"
	end

	def download_selected
		profile_id = params["data"]
		selected_profile = []

		profile_id.each do |id|
			profile = Profile.find(id.to_i)
			selected_profile << profile
		end

		@pdf = CombinePDF.new
		selected_profile.each do |profile|
			url = profile.resume.url
			suburl = url[/[^?]+/]
			@pdf << CombinePDF.load("#{Rails.root}/public" + suburl)
		end
		@pdf.save "#{Rails.root}/selected_combined.pdf"
	end

	def combined_selected
		@pdf = CombinePDF.load("#{Rails.root}/selected_combined.pdf")
		send_data @pdf.to_pdf, filename: "selected_combined.pdf", type: "application/pdf"
	end

	private

	def profile_params
		params.require(:profile).permit(:resume, :first_name, :last_name, :university, :graduation_year, :company, :location, :gender, :start_date)
	end
end