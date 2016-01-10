FactoryGirl.define do
  factory :product do
  	title "Verifone 610"
  	description "GRIFFEN is the first of its kind: a Credit Card POS System developed exclusively for 
                 the legal marijuana industry. With patented double encrypted software and a FSC 
                 code specific to marijuana together with reliable Verifone hardware, GRIFFEN 
                 transactions are date stamped and transparently verified as a retail exchange of 
                 product for  a dollar payment, and securely processed through the Credit Card 
                 Processing System with ACH Deposits to bank accounts in exactly the same manner 
                 as any other retailer in the USA."
  	price 650.00
  	image_url "#{Rails.root}/spec/images/vx610.jpg"

    trait :invalid do
      title nil
    end
  end
end
