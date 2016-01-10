require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has a valid factory' do
    expect(build(:product)).to be_valid
  end

  context 'validations' do
  	it { should validate_presence_of :title }
  	it { should validate_presence_of :description }
  	it { should validate_presence_of :image_url }
  	it { should validate_presence_of :price }
  	it { should validate_uniqueness_of :title }
  end
end
