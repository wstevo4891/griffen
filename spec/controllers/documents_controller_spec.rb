require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do

  #Sign in a user for the rest of the tests
  before(:each) do
  	@user = create(:user)
  	sign_in @user
  end

  describe "GET #show" do
    before(:each) do
      @document = create(:document)
      get :show, user_id: @user.id, id: @document
    end

  	it "locates the requested @document" do
  	  expect(assigns(:document)).to eq(@document)
  	end

  	it "renders the :show view" do
  	  expect(response).to render_template :show
  	end
  end

  describe "GET #new" do
  	it "locates the requested @document" do
  	  get :new, user_id: @user.id
  	  expect(assigns(:document)).to be_a_new(Document)
  	end

  	it "renders the :new view" do
  	  get :new, user_id: @user.id
  	  expect(response).to render_template :new
  	end
  end

  describe "GET #edit" do
    before(:each) do
  	  @document = create(:document)
  	  get :edit, user_id: @user.id, id: @document
  	end

  	it "locates the requested @document" do
  	  expect(assigns(:document)).to eq(@document)
  	end

  	it "renders the :edit view" do
  	  expect(response).to render_template :edit
  	end
  end

  describe "POST #create" do
  	context "with valid params" do
  	  let(:post_create) { post :create, user_id: @user.id, document: attributes_for(:document) }

  	  it "creates a new Document" do
  	  	expect {
  	  	  post_create
  	  	}.to change(Document, :count).by(1)
  	  end

  	  it "assigns a newly created document as @document" do
  	  	post_create
  	  	expect(assigns(:document)).to be_a(Document)
  	  	expect(assigns(:document)).to be_persisted
  	  end

  	  it "redirects to the user profile" do
  	  	post_create
  	  	expect(response).to redirect_to(@user)
  	  end
  	end

  	context "with invalid params" do
  	  let(:post_invalid) { post :create, user_id: @user.id, document: attributes_for(:document, :invalid) }

  	  it "does not save the new document" do
  	  	expect {
  	  	  post_invalid
  	  	}.to_not change(Document, :count)
  	  end

  	  it "assigns a newly created but unsaved document as @document" do
  	  	post_invalid
  	  	expect(assigns(:document)).to be_a_new(Document)
  	  end

  	  it "re-renders the 'new' template" do
  	  	post_invalid
  	  	expect(response).to render_template("new")
  	  end
  	end
  end

  describe "PUT #update" do
  	before(:each) do
  	  @document = create(:document, name: "Larry Smith")
  	end

  	context "with valid params" do
  	  let(:put_update) { put :update, user_id: @user.id, id: @document, document: attributes_for(:document) }

  	  it "locates the requested @document" do
  	  	put_update
  	  	expect(assigns(:document)).to eq(@document)
  	  end

  	  it "updates the requested @document" do
  	  	put :update, user_id: @user.id, id: @document, document: attributes_for(:document, name: "Jimmy Bones")
  	  	@document.reload
  	  	expect(@document.name).to eq("Jimmy Bones")
  	  end

  	  it "redirects to the user profile" do
  	  	put_update
  	  	expect(response).to redirect_to(@user)
  	  end
  	end

  	context "with invalid params" do
  	  let(:put_invalid) { put :update, user_id: @user.id, id: @document, document: attributes_for(:document, :invalid) }
      
      it "locates the requested @document" do
      	put_invalid
      	expect(assigns(:document)).to eq(@document)
      end

      it "does not change @document's attributes" do
      	put_invalid
      	@document.reload
      	expect(@document.name).to_not eq("Jimmy Bones")
      end

      it "re-renders the 'edit' template" do
      	put_invalid
      	expect(response).to render_template("edit")
      end
  	end
  end

  describe "DELETE #destroy" do
  	let(:delete_doc) { delete :destroy, user_id: @user.id, id: @document }
  	before(:each) do
  	  @document = create(:document)
  	end

  	it "deletes the @document" do
  	  expect {
  	  	delete_doc
  	  }.to change(Document, :count).by(-1)
  	end

  	it "redirects to the user profile" do
  	  delete_doc
  	  expect(response).to redirect_to(@user)
  	end

  	it "redirects to the documents #index" do
  	  @admin = create(:admin)
  	  sign_in @admin
  	  delete_doc
  	  expect(response).to redirect_to admin_documents_url
  	end
  end
end
