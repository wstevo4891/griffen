class User < ActiveRecord::Base
  has_secure_password
  after_destroy :ensure_an_admin_remains
  validates :name, :email, presence: true
  has_one :document, dependent: :destroy
  
  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end
end
