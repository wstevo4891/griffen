class Member < ActiveRecord::Base
  mount_uploader :memid, ImageUploader
end
