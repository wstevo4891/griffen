FactoryGirl.define do
  factory :shareholder do
    sname "Larry Jenkins"
    shid File.open(File.join(Rails.root, "/spec/images/cuzco.jpg"))
  end
end
