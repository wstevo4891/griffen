class Order < ActiveRecord::Base
  belongs_to :user

  PRODUCT_TYPES = [ "Verifone 610", "Verifone 510"]
  PAYMENT_TYPES = [ "Check", "Credit Card", "Purchase Order" ]
  validates :name, :business, :email, :phone, presence: true
  validates :product, inclusion: PRODUCT_TYPES
  validates :payment, inclusion: PAYMENT_TYPES
end
