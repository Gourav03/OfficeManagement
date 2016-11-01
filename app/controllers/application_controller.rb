class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :index
  after_action :check_date_of_birth

  private 

  def check_date_of_birth
  	if (user_signed_in?)  		 
  		 User.pluck(:date_of_birth)  

  	end
  end


end
  
