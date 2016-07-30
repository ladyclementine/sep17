
require 'rails_helper' 
describe Event do 
 
before(:each) do
	@event1 = FactoryGirl.create(:event)
	@event2 = FactoryGirl.create(:event)
	@event3 = FactoryGirl.create(:event)
	@event4 = FactoryGirl.create(:event)
	@event1.schedules.create(FactoryGirl.create(:schedule))
	@event2.schedules.create(FactoryGirl.create(:schedule))
	@event3.schedules.create(FactoryGirl.create(:schedule))
	@event4.schedules.create(FactoryGirl.create(:schedule))
end




it "returns even numbers" do

	event =  Event.appointments
	day = Event.days
	events = event[day.first]
numbers = (0..10).select {|n| n % 2 == 0 }
expect(event).to eql({"2016-11-12"=>["evento1"]})
end
it "returns odd numbers" do
end

end


