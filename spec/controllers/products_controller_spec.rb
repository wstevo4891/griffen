require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  before(:each) do
    @admin = create(:admin)
    sign_in @admin
  end

  describe "GET #index" do
    it "assigns all products as @products" do
      @product = create(:product)
      get :index
      expect(assigns(:products)).to eq([@product])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "locates the requested @product" do
      @product = create(:product)
      get :show, id: @product
      expect(assigns(:product)).to eq(@product)
    end

    it "renders the :show view" do
      get :show, id: create(:product)
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new product as @product" do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end

    it "renders the :new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    before(:each) do
      @product = create(:product)
      get :edit, id: @product
    end

    it "locates the requested @product" do
      expect(assigns(:product)).to eq(@product)
    end

    it "renders the :edit view" do
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:post_create) { post :create, product: attributes_for(:product) }

      it "creates a new Product" do
        expect {
          post_create
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post_create
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

      it "redirects to the products index" do
        post_create
        expect(response).to redirect_to(products_url)
      end
    end

    context "with invalid params" do
      let(:post_invalid) { post :create, product: attributes_for(:product, :invalid) }

      it "does not save the new product" do
        expect {
          post_invalid
        }.to_not change(Product, :count)
      end

      it "assigns a newly created but unsaved product as @product" do
        post_invalid
        expect(assigns(:product)).to be_a_new(Product)
      end

      it "re-renders the 'new' template" do
        post_invalid
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      @product = create(:product, title: "Dinglehopper")
    end

    context "with valid params" do
      let(:put_update) { put :update, id: @product, product: attributes_for(:product) }

      it "updates the requested product" do
        put :update, id: @product, product: attributes_for(:product, title: "Doodle Meister")
        @product.reload
        expect(@product.title).to eq("Doodle Meister")
      end

      it "locates the requested @product" do
        put_update
        expect(assigns(:product)).to eq(@product)
      end

      it "redirects to the products #index" do
        put_update
        expect(response).to redirect_to(products_url)
      end
    end

    context "with invalid params" do
      let(:put_invalid) { put :update, id: @product, product: attributes_for(:product, :invalid) }

      it "locates the requested @product" do
        put_invalid
        expect(assigns(:product)).to eq(@product)
      end

      it "does not change @product's attributes" do
        put_invalid
        @product.reload
        expect(@product.title).to_not eq("Doodle Meister")
      end

      it "re-renders the 'edit' template" do
        put_invalid
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:delete_product) { delete :destroy, id: @product }
    before(:each) do
      @product = create(:product)
    end

    it "deletes the requested @product" do
      expect {
        delete_product
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products #index" do
      delete_product
      expect(response).to redirect_to(products_url)
    end
  end
end
