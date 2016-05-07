require 'rails_helper'

RSpec.describe Ach do
  it 'has a valid factory' do
    expect(build(:ach)).to be_valid
  end
  
  context 'validations' do
  	it { is_expected.to validate_presence_of :legalname }
  	it { is_expected.to validate_presence_of :pname }
  	it { is_expected.to validate_presence_of :pphone }
  	it { is_expected.to validate_presence_of :paddress }
  end

  context 'associations' do
  	it { is_expected.to belong_to(:user) }
  end  
end
