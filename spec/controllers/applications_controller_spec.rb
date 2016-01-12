require 'rails_helper'

RSpec.describe ApplicationsController, type: :controller do
  after(:all) do
    File.delete(Rails.root.join("pdfs", "John Doe.merchant_application.pdf"))
    File.delete(Rails.root.join("pdfs", "Jimmy Bones.merchant_application.pdf"))
  end  

  describe "GET #index" do
    # Sign in an admin to see Applications Index page
    before(:each) do
      @admin = create(:admin)
      sign_in @admin
    end

    it "assigns all applications as @applications" do
      @application = create(:application)
      get :index
      expect(assigns(:applications)).to eq([@application])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  # Sign in a user for the rest of the tests
  before (:each) do
    @user = create(:user)
    sign_in @user
  end 

  describe "GET #show" do
    it "locates the requested @application" do
      @application = create(:application)
      get :show, id: @application
      expect(assigns(:application)).to eq(@application)
    end

    it "renders the :show view" do
      get :show, id: create(:application)
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new application as @application" do
      get :new
      expect(assigns(:application)).to be_a_new(Application)
    end

    it "renders the :new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    before(:each) do
      @application = create(:application)
      get :edit, id: @application
    end

    it "locates the requested @application" do
      expect(assigns(:application)).to eq(@application)
    end

    it "renders the :edit view" do
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid params", :vcr do
      let(:post_create) { post :create, application: attributes_for(:application) }

      it "creates a new Application" do
        expect {
          post_create
        }.to change(Application, :count).by(1)
      end

      it "assigns a newly created application as @application" do
        post_create
        expect(assigns(:application)).to be_a(Application)
        expect(assigns(:application)).to be_persisted
      end

      it "redirects to the user profile" do
        post_create
        expect(response).to redirect_to(@user)
      end
    end

    context "with invalid params" do
      let(:post_invalid) { post :create, application: attributes_for(:application, :invalid) }

      it "does not save the new application" do
        expect {
          post_invalid
        }.to_not change(Application, :count)
      end

      it "assigns a newly created but unsaved application as @application" do
        post_invalid
        expect(assigns(:application)).to be_a_new(Application)
      end

      it "re-renders the 'new' template" do
        post_invalid
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      @application = create(:application, oname: "Larry Smith")
    end

    context "with valid params", :vcr do
      let(:put_update) { put :update, id: @application, application: attributes_for(:application) }

      it "locates the requested @application" do
        put_update
        expect(assigns(:application)).to eq(@application)
      end

      it "updates the requested application" do
        put :update, id: @application, application: attributes_for(:application, 
          oname: "Jimmy Bones", legalname: "Bones' Bongs")
        @application.reload
        expect(@application.oname).to eq("Jimmy Bones")
        expect(@application.legalname).to eq("Bones' Bongs")
      end

      it "redirects to the user profile" do
        put_update
        expect(response).to redirect_to(@user)
      end
    end

    context "with invalid params" do
      let(:put_invalid) { put :update, id: @application, application: attributes_for(:application, :invalid) }

      it "locates the requested @application" do
        put_invalid
        expect(assigns(:application)).to eq(@application)
      end

      it "does not change @application's attributes" do
        put_invalid
        @application.reload
        expect(@application.oname).to_not eq("Jimmy Bones")
      end

      it "re-renders the 'edit' template" do
        put_invalid
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:delete_app) { delete :destroy, id: @application }
    before(:each) do
      @application = create(:application)
    end

    it "deletes the @application" do
      expect {
        delete_app
      }.to change(Application, :count).by(-1)
    end

    it "redirects to the user profile" do
      delete_app
      expect(response).to redirect_to(@user)
    end

    it "redirects to the applications :index" do
      @admin = create(:admin)
      sign_in @admin
      delete_app
      expect(response).to redirect_to applications_url
    end
  end
end
