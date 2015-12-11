class Application < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  validates :oname, :legalname, :email, :phone, presence: true
  mount_uploader :voidcheck, ImageUploader
  mount_uploader :dlicense, ImageUploader	
end
