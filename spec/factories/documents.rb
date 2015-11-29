require 'faker'

FactoryGirl.define do
  factory :document do |f|
    f.name { Faker::Name.name }
    f.business { Faker::Company.name }
    f.email { Faker::Internet.email }
    f.phone { Faker::PhoneNumber.phone_number }
    f.product { Faker::Commerce.product_name }
    f.payment { Faker::Business.credit_card_type }
  end
end