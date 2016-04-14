class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :timeoutable, :validatable

  validates :firstname, :lastname, :business, :phone, presence: true

  has_many :orders, dependent: :destroy
  has_many :access_tokens, dependent: :destroy
  
  has_one :application, dependent: :destroy
  has_one :ach, dependent: :destroy
  has_one :document, dependent: :destroy

  def issue_access_token
    access_tokens.create!
  end  
end
