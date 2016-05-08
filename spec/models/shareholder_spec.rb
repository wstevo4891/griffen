require 'rails_helper'

RSpec.describe Shareholder, type: :model do
  it 'has a valid factory' do
    expect(build(:shareholder)).to be_valid
  end
end
