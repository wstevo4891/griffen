require 'faker'

FactoryGirl.define do
  factory :application do |f|
  	f.oname { Faker::Name.name }
    f.legalname { Faker::Company.name }
    f.email { Faker::Internet.email }
    f.phone { Faker::PhoneNumber.phone_number }    
  end

end
