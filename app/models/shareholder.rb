class Shareholder < ActiveRecord::Base
  belongs_to :document
  validates :sname, :shid, presence: true
  mount_uploader :shid, ImageUploader
end
