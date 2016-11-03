class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def index		
		@users = User.where(role: 0).paginate(:page => params[:page], :per_page => 5)	
	end

	def create		
		user = User.new(user_params)			
		user.save ? (redirect_to users_path) : (render 'new')		
	end

	def edit
		@user = User.find(params[:id])		
	end

	def update
		User.find(params[:id]).update(user_params) ? (redirect_to users_path) : (render 'edit')
	end
			
	def destroy
		@user = User.find(params[:id]).destroy		
		redirect_to users_path
	end


	private
	def user_params
		params.require(:user).permit(:email, :password)
	end

end
