require "rails_helper"

describe Document do
  it "has a valid factory" do
    FactoryGirl.create(:document).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:document, name: nil).should_not be_valid
  end
  it "is invalid without a business" do
    FactoryGirl.build(:document, business: nil).should_not be_valid
  end
  it "is invalid without an email" do
    FactoryGirl.build(:document, email: nil).should_not be_valid
  end
  it "is invalid without a phone number" do
    FactoryGirl.build(:document, phone: nil).should_not be_valid
  end
  it "is invalid without a product" do
    FactoryGirl.build(:document, product: nil).should_not be_valid
  end
  it "is invalid without a payment" do
    FactoryGirl.build(:document, payment: nil).should_not be_valid
  end
end