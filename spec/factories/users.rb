FactoryGirl.define do

  factory :user do
    transient do
      skip_confirmation true
    end

    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    sequence(:email) { |n| "user#{n}@example.tld" }
    business { Faker::Company.name }
    phone { Faker::PhoneNumber.phone_number }
    password  "zx%-7$6yu23"  
  end

end