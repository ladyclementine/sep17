FactoryGirl.define do

  sequence :start_time do |n|
    DateTime.new(2011,n, 10)
  end

  factory :schedule do
    
    start_time
   
    
    
    

   

   

  end
end

