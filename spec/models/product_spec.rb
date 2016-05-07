require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has a valid factory' do
    expect(build(:product)).to be_valid
  end

  context 'validations' do
  	it { is_expected.to validate_presence_of :title }
  	it { is_expected.to validate_presence_of :description }
  	it { is_expected.to validate_presence_of :image_url }
  	it { is_expected.to validate_presence_of :price }
  	it { is_expected.to validate_uniqueness_of :title }
  end
end
