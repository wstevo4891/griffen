require 'rails_helper'

RSpec.describe Member, type: :model do
  it 'has a valid factory' do
    expect(build(:member)).to be_valid
  end
end
