class Order < ActiveRecord::Base
  belongs_to :user

  has_one :application
  has_one :ach
  has_one :document

  PRODUCT_TYPES = ["Verifone 610", "Verifone 510"]
  PAYMENT_TYPES = [ "Check", "Credit card", "Paypal" ]
  validates :name, :business, :email, :phone, presence: true
  validates :product, inclusion: PRODUCT_TYPES
  validates :payment, inclusion: PAYMENT_TYPES  
end
