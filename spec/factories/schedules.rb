FactoryGirl.define do

  sequence :start_time do |n|
    Faker:: DateTime.new(2011,n, 10)
  end

  factory :schedule do
    
    start_time
    event
    
    
    

   

    before(:create) do |schedule|
      schedule.tags << create(:tag)
    end

  end
end

