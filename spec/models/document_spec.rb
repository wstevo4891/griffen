require "rails_helper"

RSpec.describe Document do
  it 'has a valid factory' do
    expect(build(:document)).to be_valid
  end

  context 'validations' do
  	it { is_expected.to validate_presence_of :name }
  	it { is_expected.to validate_presence_of :business }
  	it { is_expected.to validate_presence_of :email }
  	it { is_expected.to validate_presence_of :phone }
  end

  context 'associations' do
  	it { is_expected.to belong_to(:user) }
  	it { is_expected.to have_many(:members) }
  	it { is_expected.to have_many(:shareholders) }
  end 
end