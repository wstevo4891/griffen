class Ach < ActiveRecord::Base
  belongs_to :user
  validates :legalname, presence: true	
end
