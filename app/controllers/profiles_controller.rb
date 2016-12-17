class ProfilesController < ApplicationController

	 def authenticate
	   authenticate_or_request_with_http_basic('Administration') do |username, password|
	     username == ENV['ADMIN'] && password == ENV['CODE']
	   end
	 end

	def index
		self.authenticate
		@profiles = Profile.where(active: true)
		@profiles.order("created_at")
	end

	def new
		@profile = Profile.new
	end

	def create
		p params["profile"]["start_date_current(2i)"]
		p params["profile"]["start_date_current(1i)"]

		if params["profile"]["start_date_current(2i)"] == "1"
			month = "January"
		elsif params["profile"]["start_date_current(2i)"] == "2"
			month = "February"
		elsif params["profile"]["start_date_current(2i)"] == "3"
			month = "March"
		elsif params["profile"]["start_date_current(2i)"] == "4"
			month = "April"
		elsif params["profile"]["start_date_current(2i)"] == "5"
			month = "May"
		elsif params["profile"]["start_date_current(2i)"] == "6"
			month = "June"
		elsif params["profile"]["start_date_current(2i)"] == "7"
			month = "July"
		elsif params["profile"]["start_date_current(2i)"] == "8"
			month = "August"
		elsif params["profile"]["start_date_current(2i)"] == "9"
			month = "September"
		elsif params["profile"]["start_date_current(2i)"] == "10"
			month = "October"	
		elsif params["profile"]["start_date_current(2i)"] == "11"
			month = "November"	
		else
			month = "December"	
		end
			
		start_date = month + " " + params["profile"]["start_date_current(1i)"]

		@profile = Profile.new(profile_params.merge(start_date_current: start_date))
		if @profile.save
			flash[:success] = "The profile was added!"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
		profile = Profile.find(params[:id])
		url = profile.resume.url
		pdf = CombinePDF.new
		pdf << CombinePDF.parse( Net::HTTP.get( URI.parse( "https:" + url ) ) )
		send_data pdf.to_pdf, filename: "single.pdf", type: "application/pdf"
	end

	def edit
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.find(params[:id].to_i)
		@profile.update_attributes(profile_params) 

		if @profile.save
      redirect_to profiles_path
    else
      @errors = @profile.errors.full_messages
      render 'new'
    end
	end

	def destroy
	  @profile = Profile.find(params[:id])
	  @profile.active = false
	  @profile.save
	  redirect_to profiles_path
	end

	def download_all
		@profiles = Profile.order(params["order"])
		@pdf = CombinePDF.new
		@profiles.each do |profile|
			url = profile.resume.url
			@pdf << CombinePDF.parse( Net::HTTP.get( URI.parse( "https:" + url ) ) )
		end
		@pdf.save "#{Rails.root}/combined.pdf"
		send_data @pdf.to_pdf, filename: "combined.pdf", type: "application/pdf"
	end

	def download_selected
		profile_id = params["data"]
		order = params["order"]
		selected_profile = []

		profile_id.each do |id|
			profile = Profile.find(id.to_i)
			selected_profile << profile
		end

		selected_profile.sort! { |a,b| "a." + order <=> "b." + order }
		p selected_profile
		@pdf = CombinePDF.new
		selected_profile.each do |profile|
			url = profile.resume.url
			@pdf << CombinePDF.parse( Net::HTTP.get( URI.parse( "https:" + url ) ) )
		end
		@pdf.save "#{Rails.root}/selected_combined.pdf"
		send_data @pdf.to_pdf, filename: "selected_combined.pdf", type: "application/pdf"
	end

	def combined_selected
		sleep 5
		@pdf = CombinePDF.load("#{Rails.root}/selected_combined.pdf")
		send_data @pdf.to_pdf, filename: "selected_combined.pdf", type: "application/pdf"
	end

	def destroy_selected
		profile_id = params["data"]

		if profile_id

			selected_profile = []

			profile_id.each do |id|
				profile = Profile.find(id.to_i)
				profile.active = false
				profile.save
			end
		end

		redirect_to profiles_path
	end

	private

	def profile_params
		params.require(:profile).permit(:resume, :first_name, :last_name, :university, :graduation_year, :company, :current_location, :region, :gender, :start_date_pe, :industry_preference_first, :industry_preference_second, :industry_preference_third)
	end
end