class Ach < ActiveRecord::Base
  belongs_to :user
  validates :legalname, :pname, :pphone, :paddress, presence: true	
end
