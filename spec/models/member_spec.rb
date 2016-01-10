require 'rails_helper'

RSpec.describe Member, type: :model do
  it 'has a valid factory' do
    expect(build(:member)).to be_valid
  end

  context "validations" do
  	it { should validate_presence_of :mname }
  	it { should validate_presence_of :memid }
  end

  context "associations" do
  	it { should belong_to :document }
  end
end
