FactoryGirl.define do
  factory :document do
  	name "John Doe"
  	business "Emerald City Greens"
  	sequence(:email) { |n| "user#{n}@example.tld" }
  	phone { Faker::PhoneNumber.phone_number }

  	trait :invalid do
  	  name nil
  	end

  	trait :with_members do
  	  build(:member)
  	end

  	trait :with_shareholders do
  	  build(:shareholder)
  	end
  end  
end