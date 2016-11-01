class ProfilesController < ApplicationController
	
	def new		
	end

	def index		
	end
	
	def create
		profile = Profile.create()
	end

	def edit		
		@profile = Profile.find(params[:id])		
	end

	def update
		
		@profile = Profile.find(params[:id])
		@profile.update(user_params) ? (redirect_to user_profile_path(current_user.id, @profile)) :	(render 'edit')
	end

	def show			
		@profile = Profile.find(params[:id])			
	end

	private
	def user_params
		params.require(:profile).permit(:image, :name, :designation, :address, :contact_number, :date_of_birth, :user_id)
	end

end
