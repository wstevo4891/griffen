require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
  	ImageUploader.enable_processing = true
    @uploader = ImageUploader.new(@application, :voidcheck)

    File.open(Rails.root.join("spec/images", "salt_flats.jpg")) do |f|
      @uploader.store!(f)
    end
  end

  after do
  	ImageUploader.enable_processing = false
  	@uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 200 by 150 pixels" do
      expect(@uploader.thumb).to have_dimensions(200, 150)
    end
  end

  it "should make the image readable only to the owner and admins" do
  	expect(@uploader).to have_permissions(0644)
  end
end
