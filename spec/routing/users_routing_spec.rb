require "rails_helper"

RSpec.describe UsersController do
  describe "routing" do
    
    it "recognizes and generates #new" do
      expect({get: "/users/new"}).to route_to(controller: "users", action: "new")
    end

    it "recognizes and generates #show" do
      @user = create(:user)
      expect({get: "users/#{@user.id}"}).to route_to(controller: "users", action: "show", id: @user)
    end
    
  end
end
