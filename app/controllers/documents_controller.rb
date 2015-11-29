class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end
  
  def filename
    @document.business
  end   
  
  def current_document
    @current_document ||= Document.find(session[:id])
  end 
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end  

  # GET /documents/1
  # GET /documents/1.json
  def show
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
        render pdf: 'Required_Documents',   # Excluding ".pdf" extension.
               layout: 'pdf.html.erb',
               template: 'documents/edit.pdf.erb',
               wkhtmltopdf: 'bin/wkhtmltopdf',
               page_height: '10',
               page_width: '10em'
      end
    end     
  end
  
  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)   

    respond_to do |format|
      if @document.save
        pdf = render_to_string pdf: "Required_Documents.pdf", 
        layout: 'pdf.html.erb', 
        template: "documents/edit.pdf.erb", 
        encoding: "UTF-8", 
        wkhtmltopdf: 'bin/wkhtmltopdf', 
        page_height: '10in', 
        page_width: '10em'
        save_path = Rails.root.join('pdfs',"#{filename}.Required_Documents.pdf")
        File.open(save_path, 'wb') do |file|
          file << pdf
        end   
        file = open(save_path)  
        client = DropboxClient.new(OAUTH2_ACCESS_TOKEN)
        response = client.put_file('Applications/' + filename + '.Required_Documents.pdf', file)                
        format.html { redirect_to root_path, notice: 'Documents were successfully uploaded.' }
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
      if @document.update(document_params)
        pdf = render_to_string pdf: "Required_Documents.pdf", 
        layout: 'pdf.html.erb', 
        template: "documents/edit.pdf.erb", 
        encoding: "UTF-8", 
        wkhtmltopdf: 'bin/wkhtmltopdf', 
        page_height: '10in', 
        page_width: '10em'
        save_path = Rails.root.join('pdfs',"#{filename}.Required_Documents.pdf")
        File.open(save_path, 'wb') do |file|
          file << pdf
        end   
        file = open(save_path)  
        client = DropboxClient.new(OAUTH2_ACCESS_TOKEN)
        response = client.put_file('Applications/' + filename + '.Required_Documents.pdf', file, overwrite=true)               
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
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
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
      params.require(:document).permit(:name, :business, :email, :phone, :product, :payment)
    end
end
