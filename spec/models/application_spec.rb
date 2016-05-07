require 'rails_helper'

RSpec.describe Application do
  it 'has a valid factory' do
    expect(build(:application)).to be_valid
  end
  
  context 'validations' do
  	it { is_expected.to validate_presence_of :oname }
  	it { is_expected.to validate_presence_of :legalname }
  	it { is_expected.to validate_presence_of :email }
  	it { is_expected.to validate_presence_of :phone }
  end

  context 'associations' do
  	it { is_expected.to belong_to(:user) }
  end
end
