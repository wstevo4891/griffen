FactoryGirl.define do
  factory :ach do
  	legalname { Faker::Company.name }
  	pname "John Doe"
  	pphone { Faker::PhoneNumber.phone_number }
  	paddress { Faker::Address.street_address }

  	trait :invalid do
  	  legalname nil
  	end
  end
end
