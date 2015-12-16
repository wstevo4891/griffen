FactoryGirl.define do
  factory :document do
  	name "John Doe"
  	business { Faker::Company.name }
  	sequence(:email) { |n| "user#{n}@example.tld" }
  	phone { Faker::PhoneNumber.phone_number }
  end  
end