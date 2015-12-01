require 'rails_helper'

RSpec.describe "Aches", type: :request do
  describe "GET /aches" do
    it "works! (now write some real specs)" do
      get aches_path
      expect(response).to have_http_status(200)
    end
  end
end
