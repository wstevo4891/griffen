require 'rails_helper'

RSpec.describe AchesController, type: :controller do 
  
  # Sign in a user for the rest of the tests
  before (:each) do
    @user = create(:user)
    sign_in @user
  end 

  describe "GET #show" do
    it "assigns the requested ach as @ach" do
      @ach = create(:ach)
      get :show, user_id: @user.id, id: @ach
      expect(assigns(:ach)).to eq(@ach)
    end

    it "renders the :show view" do
      get :show, user_id: @user.id, id: create(:ach)
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new ach as @ach" do
      get :new, user_id: @user.id
      expect(assigns(:ach)).to be_a_new(Ach)
    end

    it "renders the :new view" do
      get :new, user_id: @user.id
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested ach as @ach" do
      ach = create(:ach)
      get :edit, user_id: @user.id, id: ach
      expect(assigns(:ach)).to eq(ach)
    end

    it "renders the :edit view" do
      ach = create(:ach)
      get :edit, user_id: @user.id, id: ach
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:post_create) { post :create, user_id: @user.id, ach: attributes_for(:ach) }

      it "creates a new Ach" do
        expect {
          post_create
        }.to change(Ach, :count).by(1)
      end

      it "assigns a newly created ach as @ach" do
        post_create
        expect(assigns(:ach)).to be_a(Ach)
        expect(assigns(:ach)).to be_persisted
      end

      it "redirects to the user profile" do
        post_create
        expect(response).to redirect_to(@user)
      end
    end

    context "with invalid params" do
      let(:post_invalid) { post :create, user_id: @user.id, ach: attributes_for(:ach, :invalid) }

      it "does not save the new ach" do
        expect {
          post_invalid
          }.to_not change(Ach, :count)
      end

      it "assigns a newly created but unsaved ach as @ach" do
        post_invalid
        expect(assigns(:ach)).to be_a_new(Ach)
      end

      it "re-renders the 'new' template" do
        post_invalid
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      @ach = create(:ach, legalname: "Smith's Bongs")
    end

    context "with valid params" do
      let(:put_update) { put :update, user_id: @user.id, id: @ach, ach: attributes_for(:ach) }

      it "updates the requested ach" do
        put :update, user_id: @user.id, id: @ach, ach: attributes_for(:ach, legalname: "Bones' Bongs")
        @ach.reload
        expect(@ach.legalname).to eq("Bones' Bongs")
      end

      it "locates the requested @ach" do
        put_update
        expect(assigns(:ach)).to eq(@ach)
      end

      it "redirects to the user profile" do
        put_update
        expect(response).to redirect_to(@user)
      end
    end

    context "with invalid params" do
      let(:put_invalid) { put :update, user_id: @user.id, id: @ach, ach: attributes_for(:ach, :invalid) }

      it "locates the requested @ach" do
        put_invalid
        expect(assigns(:ach)).to eq(@ach)
      end

      it "does not change @ach's attributes" do
        put_invalid
        @ach.reload
        expect(@ach.legalname).to_not eq("Bones' Bongs")
      end

      it "re-renders the 'edit' template" do
        put_invalid
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:delete_ach) { delete :destroy, user_id: @user.id, id: @ach }

    before(:each) do
      @ach = create(:ach)
    end

    it "deletes the requested ach" do
      expect {
        delete_ach
      }.to change(Ach, :count).by(-1)
    end

    it "redirects to the user profile" do
      delete_ach
      expect(response).to redirect_to(@user)
    end

    it "redirects to the aches #index" do
      @admin = create(:admin)
      sign_in @admin
      delete_ach
      expect(response).to redirect_to admin_aches_url
    end
  end

end
