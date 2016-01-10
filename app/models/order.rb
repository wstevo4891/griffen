class Order < ActiveRecord::Base
  belongs_to :user
  validates :name, :business, :email, :phone, presence: true
end
