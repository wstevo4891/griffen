require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has a valid factory' do
    expect(build(:product)).to be_valid
  end
end
