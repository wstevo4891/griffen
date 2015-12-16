require "rails_helper"

RSpec.describe Document do
  context 'validations' do
  	it { should validate_presence_of :name }
  	it { should validate_presence_of :business }
  	it { should validate_presence_of :email }
  	it { should validate_presence_of :phone }
  end

  context 'associations' do
  	it { should belong_to(:user) }
  	it { should have_many(:members) }
  	it { should have_many(:shareholders) }
  end 
end