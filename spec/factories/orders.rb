FactoryGirl.define do
  factory :order do
  	name "John Doe"
  	business "Emerald City Greens"
  	sequence(:email) { |n| "user#{n}@example.tld" }
  	phone { Faker::PhoneNumber.phone_number }
  	product "Verifone 510"
  	payment "Credit Card"

  	trait :invalid do
  	  name nil
  	end
  end
end
