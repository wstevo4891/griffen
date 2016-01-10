class Member < ActiveRecord::Base
  belongs_to :document
  validates :mname, :memid, presence: true
  mount_uploader :memid, ImageUploader
end
