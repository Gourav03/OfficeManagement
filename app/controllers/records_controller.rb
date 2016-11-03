class RecordsController < ApplicationController
	
	def new
		@record = Record.new
	end

	def create
		if Record.pluck(:date).include?(Date.today) 		
	 		record = Record.find_by(:date => Date.today) 	
	 		if (record[:created_at] == record[:updated_at])	&& (record[:total_working_hours] == nil)			
	 			if record.update(:updated_at => Time.zone.now)	
	 			  record = Record.find_by(:date => Date.today)	 			 	
			 		total_working_hours = record[:updated_at] - record[:created_at]			 		 				
			 		record.update(:total_working_hours => total_working_hours)			 			 		
	 			end
	 		else 
	 			record1 = Record.find_by(:date => Date.today)	 			
	 			if record1[:created_at].strftime("%H:%M:%S") == record1[:updated_at].strftime("%H:%M:%S")
	 				if record1.update(:updated_at => Time.zone.now)
						record2 = Record.find_by(:date => Date.today)
						total_working_hours = record2[:total_working_hours]
		 				total_working_hours += record2[:updated_at] - record2[:created_at]
		 				record2.update(:total_working_hours => total_working_hours)
		 			end
	 			else
	 				record1.update(:updated_at => Time.zone.now, :created_at => Time.zone.now) 			
	 			end
	 		end	 		
	 	else	 		
	    Record.create(record_params)	   
	  end
	 	redirect_to root_path	 	
	end

	def show
	  @records = Record.where(:user_id => params[:id]).paginate(:page => params[:page], :per_page => 1)
	end 
1
	private

	def record_params		
		params.permit(:total_working_hours, :date, :user_id)
	end
end