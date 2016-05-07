require 'rails_helper'

RSpec.describe Member, type: :model do
  it 'has a valid factory' do
    expect(build(:member)).to be_valid
  end

  context "validations" do
  	it { is_expected.to validate_presence_of :mname }
  	it { is_expected.to validate_presence_of :memid }
  end

  context "associations" do
  	it { is_expected.to belong_to :document }
  end
end
