class User < ActiveRecord::Base
  validates :firstname, :lastname, :email, :business, :phone, presence: true
  has_secure_password
  after_destroy :ensure_an_admin_remains
  
  has_one :application, dependent: :destroy
  has_one :ach, dependent: :destroy
  has_one :document, dependent: :destroy
  
  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end
end
