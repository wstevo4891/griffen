class Order < ActiveRecord::Base
  belongs_to :user

  PRODUCT_TYPES = ["Verifone 610", "Verifone 510"]
  PAYMENT_TYPES = [ "Check", "Credit Card", "Paypal" ]
  validates :name, :business, :email, :phone, presence: true
  validates :product, inclusion: PRODUCT_TYPES, presence: true
  validates :payment, inclusion: PAYMENT_TYPES, presence: true  
end
