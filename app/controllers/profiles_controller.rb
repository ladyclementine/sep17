class ProfilesController < ApplicationController
	before_action :authenticate_user!
	layout 'profile_layout'
	
  def index
  	@user = current_user
    
   

    #@cart_action = @eventCart.cart_action current_user.try :id
   
  end

  def week 
    @user = current_user
    @events = Event.all
    @eventsDays = Event.days
    @scheduleHash = Event.appointments
    @number = 0
    @my_events = current_user.get_cart_events
    @my_events_day = Event.appointment(@my_events)
   
  end 
  def week_user
      @user = current_user
    @events = Event.all
    @eventsDays = Event.days
    @scheduleHash = Event.appointments
    @number = 0
    


  end

end
