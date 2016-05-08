require 'rails_helper'

RSpec.describe Ach do
  it 'has a valid factory' do
    expect(build(:ach)).to be_valid
  end 
end
