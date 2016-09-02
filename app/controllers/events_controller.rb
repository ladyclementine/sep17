class EventsController < ProfileController
  def index
    @events = Event.all
    @eventsDays = Event.days
    @scheduleHash = Event.appointments
    @number = 0 
  end
end
