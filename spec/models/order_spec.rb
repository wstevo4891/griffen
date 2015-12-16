require 'rails_helper'

RSpec.describe Order do
  context 'validations' do
  	it { should validate_presence_of :name }
  	it { should validate_presence_of :business }
  	it { should validate_presence_of :email }
  	it { should validate_presence_of :phone }
  	it { should validate_presence_of :product }
  	it { should validate_presence_of :payment }
  end

  context 'associations' do
  	it { should belong_to(:user) }
  end 
end
