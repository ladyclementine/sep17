FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    course Faker::Educator.course
    university Faker::Educator.university
    semester Faker::Number.between(1, 10)
    password Faker::Internet.password(8)           
  end
end
