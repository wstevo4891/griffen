require 'rails_helper'

RSpec.describe Application do
  it 'has a valid factory' do
    expect(build(:application)).to be_valid
  end
end
