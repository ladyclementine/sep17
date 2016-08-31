class Event < ActiveRecord::Base
   has_many :schedules
   has_many :purchases
   has_many :buyers, through: :purchases

   def self.days
     days = []

	   self.all.each do |event|
	   	event.schedules.each do |schedule|
	      day = schedule.start_time.to_date
	      days << day unless day.in?(days) 
	   	end
	   end

    	days.sort!
      days
   end
   


   def self.appointments

      scheduleDay = Hash.new
      days = self.days
      events = self.all
      
      days.each do |day|
        scheduleDay[day] = []
         events.each do |event|
          
          event.schedules.each do |schedule|
                   
                  scheduleDay[day] << schedule if schedule.start_time.to_date == day
                  scheduleDay[day].sort_by! {|obj| obj.start_time}
          end

         end   
 
      end
      scheduleDay
      
        
   end
  def self.appointment(my_events)

      scheduleDay = Hash.new
      days = Event.days
      events = my_events
      
      days.each do |day|
        scheduleDay[day] = []
         events.each do |event|
          
          event.schedules.each do |schedule|
                   
                  scheduleDay[day] << schedule if schedule.start_time.to_date == day
                  scheduleDay[day].sort_by! {|obj| obj.start_time}
          end

         end   
 
      end
      scheduleDay
      
        
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

    
    #defini o css para o tipo de evneto


    def circleColor
      if self.kind=="palestra"
        "purple"
      else
        "warning"
        
      end
    end

    def sideAlt (number)
      if number%2==0
        "timeline-item alt"
      else
        "timeline-item "
      end
    end

    def sideArrow (number)
      if number % 2 ==0
        "arrow-alt"
      else
        "arrow"
      end
    end

#final 

    def cart_action(current_user_id)
     if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
     else
      "Add to"
      end
    end

   def self.filtered_by_shedules
     
   end
end
