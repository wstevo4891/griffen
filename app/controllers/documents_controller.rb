class DocumentsController < ApplicationController
  before_action :set_user, except: [:save_path, :render_pdf, :save_as_pdf]
  before_action :set_document, only: [:show, :edit, :update, :destroy, :dropbox_upload]
  before_action :authenticate_admin!, only: [:index]
  before_action :authenticate_user!, except: [:index]
  skip_before_action :authenticate_user!, if: :admin_signed_in?
  

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = @user.build_document
  end
  

  # GET /documents/1/edit
  def edit    
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = @user.create_document(document_params)   
    respond_to do |format|
      if @document.save
        format.html { redirect_to user_path(@user), notice: 'Thank you for submitting the required documents' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end  

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update    
    respond_to do |format|
      if @document.update(document_params)
        if admin_signed_in?
          format.html { redirect_to admin_documents_url, notice: 'Documents were successfully updated' }
        else              
          format.html { redirect_to current_user, notice: 'Documents were successfully updated' }
        end
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    if admin_signed_in?
      format.html { redirect_to admin_documents_url }
    else
      format.html { redirect_to current_user }
    end      
  end

  def filename
    @document.user_id.to_s + "_" + @document.business
  end

  def save_path
    Rails.root.join('tmp',"#{filename}.Required_Documents.pdf")
  end

  def render_pdf
    render pdf: 'Required_Documents',   # Excluding ".pdf" extension.
           layout: 'pdf.html.erb',
           template: 'documents/edit.pdf.erb',
           wkhtmltopdf: 'bin/wkhtmltopdf',
           page_height: '130',
           page_width: '12in'
  end

  def save_as_pdf
    pdf = render_to_string pdf: "Required_Documents.pdf", 
                           layout: 'pdf.html.erb', 
                           template: "documents/edit.pdf.erb", 
                           encoding: "UTF-8", 
                           wkhtmltopdf: 'bin/wkhtmltopdf', 
                           page_height: '75in', 
                           page_width: '12in'
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
  end

  def dropbox_upload
    save_as_pdf
    file = open(save_path)
    client = DropboxClient.new(OAUTH2_ACCESS_TOKEN)
    response = client.put_file('Applications/Documents/' + filename + '.Required_Documents.pdf', file, overwrite=true)
    File.delete(save_path)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_document
    @document = @user.document
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def document_params
    params.require(:document).permit(:name, :business, :email, :phone, :buslicense, 
      :buslicense_cache, :bpra, :bpra_cache, :artinc, :artinc_cache, :certform, 
      :certform_cache, :opagree, :opagree_cache, :stockcert, :stockcert_cache, 
      :llclist, :llclist_cache, :shlist, :shlist_cache, :irsidn, :combuslicense,
      :combuslicense_cache, :combpra, :combpra_cache, :user_id,
      members_attributes: [ :id, :mname, :memid, :memid_cache, :_destroy ],
      shareholders_attributes: [ :id, :sname, :shid, :shid_cache, :_destroy ])
  end
end
