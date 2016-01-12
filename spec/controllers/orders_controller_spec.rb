require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  after(:all) do
    File.delete(Rails.root.join('pdfs',"Emerald City Greens.order.pdf"))
  end

  describe "GET #index" do
    before(:each) do
      @admin = create(:admin)
      sign_in @admin
    end

    it "assigns all orders as @orders" do
      @order = create(:order)
      get :index
      expect(assigns(:orders)).to eq([@order])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  #Sign in a user for the rest of the tests
  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe "GET #show" do
    it "locates the requested @order" do
      @order = create(:order)
      get :show, id: @order
      expect(assigns(:order)).to eq(@order)
    end

    it "renders the :show view" do
      get :show, id: create(:order)
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new order as @order" do
      get :new
      expect(assigns(:order)).to be_a_new(Order)
    end

    it "renders the :new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    before(:each) do
      @order = create(:order)
      get :edit, id: @order
    end

    it "locates the requested @order" do
      expect(assigns(:order)).to eq(@order)
    end

    it "renders the :edit view" do
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid params", :vcr do
      let(:post_create) { post :create, order: attributes_for(:order) }

      it "creates a new Order" do
        expect {
          post_create
        }.to change(Order, :count).by(1)
      end

      it "assigns a newly created order as @order" do
        post_create
        expect(assigns(:order)).to be_a(Order)
        expect(assigns(:order)).to be_persisted
      end

      it "redirects to the user profile" do
        post_create
        expect(response).to redirect_to(@user)
      end

      it "redirects to the user :index" do
        @admin = create(:admin)
        sign_in @admin
        post_create
        expect(response).to redirect_to(orders_url)
      end
    end

    context "with invalid params" do
      let(:post_invalid) { post :create, order: attributes_for(:order, :invalid) }

      it "does not save the new order" do
        expect {
          post_invalid
        }.to_not change(Order, :count)
      end

      it "assigns a newly created but unsaved order as @order" do
        post_invalid
        expect(assigns(:order)).to be_a_new(Order)
      end

      it "re-renders the 'new' template" do
        post_invalid
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      @order = create(:order, name: "Larry Smith")
    end

    context "with valid params", :vcr do
      let(:put_update) { put :update, id: @order, order: attributes_for(:order) }

      it "locates the requested @order" do
        put_update
        expect(assigns(:order)).to eq(@order)
      end

      it "updates the requested order" do
        put :update, id: @order, order: attributes_for(:order, name: "Doodle Meister")
        @order.reload
        expect(@order.name).to eq("Doodle Meister") 
      end

      it "redirects to the user profile" do
        put_update
        expect(response).to redirect_to(@user)
      end

      it "redirects to the orders :index" do
        @admin = create(:admin)
        sign_in @admin
        put_update
        expect(response).to redirect_to(orders_url)
      end
    end

    context "with invalid params" do
      let(:put_invalid) { put :update, id: @order, order: attributes_for(:order, :invalid) }

      it "locates the requested @order" do
        put_invalid
        expect(assigns(:order)).to eq(@order)
      end

      it "does not change the @order's attributes" do
        put_invalid
        @order.reload
        expect(@order.name).to_not eq("Doodle Meister")
      end

      it "re-renders the 'edit' template" do
        put_invalid
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:delete_order) { delete :destroy, id: @order }
    before(:each) do
      @order = create(:order)
    end

    it "destroys the requested order" do
      expect {
        delete_order
      }.to change(Order, :count).by(-1)
    end

    it "redirects to the user profile" do
      delete_order
      expect(response).to redirect_to(@user)
    end

    it "redirects to the orders :index" do
      @admin = create(:admin)
      sign_in @admin
      delete_order
      expect(response).to redirect_to(orders_url)
    end
  end
end
