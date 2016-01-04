FactoryGirl.define do
  factory :application do
  	oname "John Doe"
  	legalname { Faker::Company.name }
  	sequence(:email) { |n| "user#{n}@example.tld" }
  	phone { Faker::PhoneNumber.phone_number }

  	trait :invalid do
  	  oname nil
  	end
  end
end
