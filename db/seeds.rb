# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
Product.delete_all
Product.create!(title: 'Griffen Vx510',
  description: 
    %{<p>
        GRIFFEN is the first of its kind Credit Card POS System developed exclusively for 
        the legal marijuana industry. With patented double encrypted software and a FSC 
        code specific to marijuana together with reliable Verifone hardware, GRIFFEN 
        transactions are date stamped and transparently verified as a retail exchange of 
        product for  a dollar payment, and securely processed through the Credit Card 
        Processing System with ACH Deposits to bank accounts in exactly the same manner 
        as any  other retailer in the USA.
      </p>},
  image_url:   'vx510.jpg',    
  price: 650.00)
# . . .
Product.create!(title: 'Griffen Vx610',
  description:
    %{<p>
        GRIFFEN is the first of its kind Credit Card POS System developed exclusively for 
        the legal marijuana industry. With patented double encrypted software and a FSC 
        code specific to marijuana together with reliable Verifone hardware, GRIFFEN 
        transactions are date stamped and transparently verified as a retail exchange of 
        product for  a dollar payment, and securely processed through the Credit Card 
        Processing System with ACH Deposits to bank accounts in exactly the same manner 
        as any  other retailer in the USA.
      </p>},
  image_url: 'vx610.jpg',
  price: 650.00)
