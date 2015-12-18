FactoryGirl.define do

  factory :admin do
    sequence(:email) { |n| "user#{n}@example.tld" }
    password  "zx%-7$6yu23"
    god_mode false    
  end
end
