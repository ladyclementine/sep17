class Event < ActiveRecord::Base
   belongs_to :week
   has_many :schedules

   def self.days
     days = []

	   self.all.each do |event|
	   	event.schedules.each do |schedule|
	      day = schedule.start_time.to_date
	      days << day unless day.in?(days) 
	   	end
	   end

    	days
   end
   


   def self.appointments

      eventsDay = Hash.new
      days = self.days
      events = []

      days.each do |day|
        self.all.each do |event|
          event.schedules.each do |schedule|
            d = schedule.start_time.to_date
            events << event unless !(d == day)
            
          end
        end
        eventsDay[day] = events
      end
      eventsDay
      
        
   end
  


   #retorna os horários em ordem 

   def self.timetables(eventsDay)
   	timetables = []

   	eventsDay.each do |event|
   		event.schedules.each do |schedule|
   			timetable = schedule.start_time
   			timetables << timetable
   		end
   	end

   	#timetables.uniq!
   	#timetables.order_by(start_time)
   	timetables

   end    

   #expressao_booleana ? 'aqui faz algo se for true' : `e aqui algo se for falso`

   #faz_algo if expressao_booleana

    #faz_algo unless !expressao_booleana
    

   #event.order_by { |e| e.schedules




   def self.filtered_by_shedules
     
   end
end
