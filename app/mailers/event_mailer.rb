class EventMailer < ApplicationMailer
	default to: Proc.new{ User.pluck(:email)},
					from: 'strive.gourav@gmail.com'

   def welcome_email(event)
    @event = event    
    mail(subject: 'Welcome to'+ @event.name)	
  end
end

