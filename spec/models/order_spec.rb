require 'rails_helper'

RSpec.describe Order do
  it 'has a valid factory' do
    expect(build(:order)).to be_valid
  end
end
