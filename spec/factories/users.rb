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
    password  "test password"
    admin false

    before(:create) do |user, evaluator|
      user.skip_confirmation! if evaluator.skip_confirmation
    end
  end

end