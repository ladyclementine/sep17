class EventsController < ProfileController
  def index
    @events = Event.all
    @eventsDays = Event.days
    @scheduleHash = Event.appointments
    @number = 0
    @my_events = @user.get_cart_events
    @my_events_day = Event.appointment(@my_events)
  end
end
