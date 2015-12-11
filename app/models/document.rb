class Document < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  
  has_many :members
  has_many :shareholders
    
  accepts_nested_attributes_for :members, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :shareholders, reject_if: :all_blank, allow_destroy: true  
    
  validates :name, :business, :email, :phone, presence: true
  mount_uploader :buslicense, ImageUploader
  mount_uploader :bpra, ImageUploader
  mount_uploader :artinc, ImageUploader
  mount_uploader :certform, ImageUploader
  mount_uploader :opagree, ImageUploader
  mount_uploader :stockcert, ImageUploader
  mount_uploader :llclist, ImageUploader
  mount_uploader :shlist, ImageUploader
  mount_uploader :combuslicense, ImageUploader
  mount_uploader :combpra, ImageUploader
end
