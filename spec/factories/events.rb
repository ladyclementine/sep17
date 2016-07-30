FactoryGirl.define do

  sequence :name do |n|
    Faker:: ("evento" + n.to_s)
  end

  factory :event do
    name
    description { Faker::Lorem.sentence }
    facilitator { Faker::Lorem.setence}
    
    type { Faker::Lorem.setence }

   

    before(:create) do |event|
      event.tags << create(:tag)
    end

  end
end


