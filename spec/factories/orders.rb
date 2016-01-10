FactoryGirl.define do
  factory :order do
  	name "John Doe"
  	business { Faker::Company.name }
  	sequence(:email) { |n| "user#{n}@example.tld" }
  	phone { Faker::PhoneNumber.phone_number }

  	trait :invalid do
  	  name nil
  	end
  end
end
