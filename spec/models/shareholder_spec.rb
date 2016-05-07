require 'rails_helper'

RSpec.describe Shareholder, type: :model do
  it 'has a valid factory' do
    expect(build(:shareholder)).to be_valid
  end

  context "validations" do
  	it { is_expected.to validate_presence_of :sname }
  	it { is_expected.to validate_presence_of :shid }
  end

  context "associations" do
  	it { is_expected.to belong_to :document }
  end
end
