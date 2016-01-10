require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe ImageUploader do
  include CarrierWave::Test::Matchers

  before(:all) do
  	ImageUploader.enable_processing = true
  end

  before(:each) do
    @uploader = ImageUploader.new(@application, :voidcheck)
  	@uploader.store!(File.open("#{Rails.root}/spec/images/salt_flats.jpg"))
  end

  after(:all) do
  	ImageUploader.enable_processing = false
  	@uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 200 by 150 pixels" do
      expect(@uploader.thumb).to have_dimensions(200, 150)
    end
  end

  it "should make the image readable only to the owner and not executable" do
  	expect(@uploader).to have_permissions(0644)
  end

  it "should be the correct format" do
  	expect(@uploader).to be_format('jpg')
  end
end
