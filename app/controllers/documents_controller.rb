class DocumentsController < ApplicationController
  before_action :authenticate_admin!, only: [:index]
  before_action :authenticate_user! || :authenticate_user!, except: [:index]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end
  
  def filename
    @document.business
  end

  def save_path
    Rails.root.join('pdfs',"#{filename}.Required_Documents.pdf")
  end

  def render_pdf
    render pdf: 'Required_Documents',   # Excluding ".pdf" extension.
           layout: 'pdf.html.erb',
           template: 'documents/edit.pdf.erb',
           wkhtmltopdf: 'bin/wkhtmltopdf',
           page_height: '130',
           page_width: '10em'
  end

  def save_as_pdf
    pdf = render_to_string pdf: "Required_Documents.pdf", 
                           layout: 'pdf.html.erb', 
                           template: "documents/edit.pdf.erb", 
                           encoding: "UTF-8", 
                           wkhtmltopdf: 'bin/wkhtmltopdf', 
                           page_height: '75in', 
                           page_width: '10em'
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
  end

  def dropbox_upload(bool)
    file = open(save_path)
    client = DropboxClient.new(OAUTH2_ACCESS_TOKEN)
    response = client.put_file('Applications/' + filename + '.Required_Documents.pdf', file, overwrite=bool)
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @document = Document.find(params[:id])
  end

  # GET /documents/new
  def new
    @document = Document.new
  end
  

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render_pdf
      end
    end     
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)   

    respond_to do |format|
      if @document.save
        save_as_pdf  
        dropbox_upload(false)               
        format.html { redirect_to current_user, notice: 'Documents were successfully uploaded' }
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
    @document = Document.find(params[:id])
    
    respond_to do |format|
      if @document.update_attributes(document_params)
        save_as_pdf 
        dropbox_upload(true)               
        format.html { redirect_to current_user, notice: 'Documents were successfully updated.' }
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
    Document.find(params[:id]).destroy
    respond_to do |format|
      if admin_signed_in?
        format.html { redirect_to documents_url, notice: 'Documents were successfully destroyed.' }
      else
        format.html { redirect_to current_user, notice: 'Documents were successfully destroyed.' }
      end
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = Document.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def document_params
    params.require(:document).permit(
        :name, :business, :email, :phone, :buslicense, :buslicense_cache,
        :bpra, :bpra_cache, :artinc, :artinc_cache, :certform, :certform_cache, 
        :opagree, :opagree_cache, :stockcert, :stockcert_cache, :llclist, 
        :llclist_cache, :shlist, :shlist_cache, :irsidn, :combuslicense,
        :combuslicense_cache, :combpra, :combpra_cache, :user_id,
        members_attributes: [ :id, :mname, :memid, :memid_cache, :_destroy ],
        shareholders_attributes: [ :id, :sname, :shid, :shid_cache, :_destroy ]
    )
  end
end

