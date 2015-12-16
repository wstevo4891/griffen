FactoryGirl.define do
  factory :order do
  	name "John Doe"
  	business { Faker::Company.name }
  	sequence(:email) { |n| "user#{n}@example.tld" }
  	phone { Faker::PhoneNumber.phone_number }
  	product "Verifone 610"
  	payment "Credit Card"
  end
end
