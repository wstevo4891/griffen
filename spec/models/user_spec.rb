require "rails_helper"

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:user, name: nil).should_not be_valid
  end
  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end
  it "is invalid without a password" do
    FactoryGirl.build(:user, password: nil).should_not be_valid
  end
  it "does not allow duplicate passwords between users" do
    user = FactoryGirl.build(:user)
    FactoryGirl.build(:user, password: "y98rth90u")
    FactoryGirl.build(:user, password: "y98rth90u").should_not be_valid
  end
end