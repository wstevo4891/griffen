class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  after_destroy :ensure_an_admin_remains

  has_many :orders, dependent: :destroy
  has_many :access_tokens, dependent: :destroy
  
  has_one :application, dependent: :destroy
  has_one :ach, dependent: :destroy
  has_one :document, dependent: :destroy

  def issue_access_token
    access_tokens.create!
  end  
  
  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end
end
