require 'rails_helper'

RSpec.describe Application do
  
  context 'validations' do
  	it { should validate_presence_of :oname }
  	it { should validate_presence_of :legalname }
  	it { should validate_presence_of :email }
  	it { should validate_presence_of :phone }
  end

  context 'associations' do
  	it { should belong_to(:user) }
  end
end
