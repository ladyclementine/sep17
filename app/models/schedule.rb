class Schedule < ActiveRecord::Base
	belongs_to :event

  def is_between?(reference)
    between_comp = reference.start_time.between?(self.start_time,self.end_time) ||
      reference.end_time.between?(self.start_time,self.end_time)
    equal_comp = reference.start_time == self.start_time ||
      reference.end_time == self.end_time

    between_comp || equal_comp
  end
end
