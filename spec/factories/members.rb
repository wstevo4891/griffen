FactoryGirl.define do
  factory :member do
    mname "Jane Roe"
    memid File.open(File.join(Rails.root, "/spec/images/salt_flats.jpg"))
  end
end
