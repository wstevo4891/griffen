require 'rails_helper'

RSpec.describe Order do
  it 'has a valid factory' do
    expect(build(:order)).to be_valid
  end

  context 'validations' do
  	it { should validate_presence_of :name }
  	it { should validate_presence_of :business }
  	it { should validate_presence_of :email }
  	it { should validate_presence_of :phone }
  end

  context 'associations' do
  	it { should belong_to(:user) }
  end 
end
