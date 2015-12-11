require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.firstname { Faker::Name.firstname }
    f.lastname { Faker::Name.lastname }
    f.email { Faker::Internet.email }
    f.business { Faker::Company.name}
    f.phone { Faker::PhoneNumber.phone_number }    
    f.password { Faker::Internet.password }
  end
end