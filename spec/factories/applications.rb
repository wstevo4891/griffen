FactoryGirl.define do
  factory :application do
  	oname "John Doe"
  	legalname { Faker::Company.name }
  	sequence(:email) { |n| "user#{n}@example.tld" }
  	phone { Faker::PhoneNumber.phone_number }
    user
    user_id 1

  	trait :invalid do
  	  oname nil
  	end

  	trait :with_images do
  	  voidcheck { File.join(Rails.root, 'spec', 'images', 'salt_flats.jpg') }
  	  dlicense { File.join(Rails.root, 'spec', 'images', 'cuzco.jpg') }
  	end
  end
end
