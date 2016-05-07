require 'rails_helper'

RSpec.describe Order do
  it 'has a valid factory' do
    expect(build(:order)).to be_valid
  end

  context 'validations' do
  	it { is_expected.to validate_presence_of :name }
  	it { is_expected.to validate_presence_of :business }
  	it { is_expected.to validate_presence_of :email }
  	it { is_expected.to validate_presence_of :phone }
  end

  context 'associations' do
  	it { is_expected.to belong_to(:user) }
  end 
end
