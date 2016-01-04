require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  context "GET #welcome" do
    it "returns http success" do
      get :welcome
      expect(response).to have_http_status(:success)
    end
  end

  context "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  context "GET #products" do
    it "returns http success" do
      get :products
      expect(response).to have_http_status(:success)
    end
  end

  context "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

  context "GET #admin" do
    it "returns http success" do
      @admin = create(:admin)
      sign_in @admin
      get :admin
      expect(response).to have_http_status(:success)
    end
  end    

end
