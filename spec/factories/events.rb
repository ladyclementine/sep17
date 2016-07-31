FactoryGirl.define do

  sequence :name do |n|
    Faker::Name.name + n.to_s
  end

  factory :event do
    name
    description { Faker::Lorem.sentences }
    facilitator { Faker::Lorem.sentence}
    
    #tip { Faker::Lorem.sentence }

   

   

  end
end


