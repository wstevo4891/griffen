require 'rails_helper'

RSpec.describe Ach do
  
  context 'validations' do
  	it { should validate_presence_of :legalname }
  	it { should validate_presence_of :pname }
  	it { should validate_presence_of :pphone }
  	it { should validate_presence_of :paddress }
  end

  context 'associations' do
  	it { should belong_to(:user) }
  end  
end
