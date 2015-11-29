require "spec_helper"

describe UsersController do
  describe "routing" do
    
    it "recognizes and generates #new" do
      {:get => "/users/new"}.should route_to(:controller => "users", :action => "new")
    end
    
  end
end
