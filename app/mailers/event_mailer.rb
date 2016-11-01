class EventMailer < ApplicationMailer
	default to: Proc.new{ User.pluck(:email)},
					from: 'gourav031192@gmail.com'

   def welcome_email(event)
    @event = event    
    mail(subject: 'Welcome to'+ @event.name)	
  end
end

