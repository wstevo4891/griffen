class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable

  after_destroy :ensure_an_admin_remains

  private
    def ensure_an_admin_remains
      if Admin.count.zero?
        raise "Can't delete last user"
      end
    end
end
