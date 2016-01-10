require 'rails_helper'

RSpec.describe UsersController do
  describe "GET #index" do
    # Sign in an admin to see Applications Index page
    before(:each) do
      @admin = create(:admin)
      sign_in @admin
    end

    it "assigns all users as @users" do
      @user = create(:user)
      get :index
      expect(assigns(:user)).to eq([@user])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end  

  context "GET 'show'" do
    before (:each) do
      @user = create(:user)
      sign_in @user
    end

    it "should be successful" do
      get :show, id: @user.id
      response { should be_success }
    end
    
    it "should find the right user" do
      get :show, id: @user.id
      assigns(:user) { should == @user }
    end
  end
end