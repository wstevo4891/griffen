require "rails_helper"

RSpec.describe Document do
  it 'has a valid factory' do
    expect(build(:document)).to be_valid
  end
end