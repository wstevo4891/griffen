class Shareholder < ActiveRecord::Base
  mount_uploader :shid, ImageUploader
end
