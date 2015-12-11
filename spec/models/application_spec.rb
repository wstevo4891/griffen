require 'rails_helper'

describe Application do
  it "has a valid factory" do
    FactoryGirl.create(:application).should be_valid
  end
  it "is invalid without an owner name" do
    FactoryGirl.build(:application, oname: nil).should_not be_valid
  end
  it "is invalid without a business" do
  	FactoryGirl.build(:application, legalname: nil).should_not be_valid
  end
  it "is invalid without an email" do
    FactoryGirl.build(:application, email: nil).should_not be_valid
  end
  it "is invalid without a phone number" do
    FactoryGirl.build(:application, phone: nil).should_not be_valid
  end
  
end
