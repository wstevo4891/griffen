class AchesController < ApplicationController
  before_action :authenticate_admin!, only: [:index]
  before_action :authenticate_user! || :authenticate_user!, except: [:index]

  # GET /aches
  # GET /aches.json
  def index
    @aches = Ach.all
  end
  
  def filename
    @ach.legalname
  end  

  # GET /aches/1
  # GET /aches/1.json
  def show
    @ach = Ach.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'ACH_agreement',   # Excluding ".pdf" extension.
               layout: 'pdf.html.erb',
               template: 'aches/edit.pdf.erb',
               wkhtmltopdf: 'bin/wkhtmltopdf',
               page_height: '47in',
               page_width: '12in'
      end
    end
  end

  # GET /aches/new
  def new
    @ach = Ach.new
  end

  # GET /aches/1/edit
  def edit
    @ach = Ach.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'ACH_agreement',   # Excluding ".pdf" extension.
               layout: 'pdf.html.erb',
               template: 'aches/edit.pdf.erb',
               wkhtmltopdf: 'bin/wkhtmltopdf',
               page_height: '47in',
               page_width: '12in'
      end
    end               
  end

  # POST /aches
  # POST /aches.json
  def create
    @ach = Ach.new(ach_params)
    respond_to do |format|
      if @ach.save
        pdf = render_to_string pdf: "ACH_agreement.pdf", 
        layout: 'pdf.html.erb', 
        template: "aches/edit.pdf.erb", 
        encoding: "UTF-8", 
        wkhtmltopdf: 'bin/wkhtmltopdf', 
        page_height: '47in', 
        page_width: '12in'
        save_path = Rails.root.join('pdfs',"#{filename}.ACH_agreement.pdf")
        File.open(save_path, 'wb') do |file|
          file << pdf
        end  
        file = open(save_path)  
        client = DropboxClient.new(OAUTH2_ACCESS_TOKEN)
        response = client.put_file('Applications/' + filename + '.ACH_agreement.pdf', file)    
        format.html { redirect_to current_user, notice: 'ACH Agreement was successfully created.' }
        format.json { render :show, status: :created, location: @ach }
      else
        format.html { render :new }
        format.json { render json: @ach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aches/1
  # PATCH/PUT /aches/1.json
  def update
    @ach = Ach.find(params[:id])
    respond_to do |format|
      if @ach.update_attributes(ach_params)
        pdf = render_to_string pdf: "ACH_agreement.pdf", 
        layout: 'pdf.html.erb', 
        template: "aches/edit.pdf.erb", 
        encoding: "UTF-8", 
        wkhtmltopdf: 'bin/wkhtmltopdf', 
        page_height: '47in', 
        page_width: '12in'
        save_path = Rails.root.join('pdfs',"#{filename}.ACH_agreement.pdf")
        File.open(save_path, 'wb') do |file|
          file << pdf
        end     
        file = open(save_path)  
        client = DropboxClient.new(OAUTH2_ACCESS_TOKEN)
        response = client.put_file('Applications/' + filename + '.ACH_agreement.pdf', file, overwrite=true)              
        format.html { redirect_to current_user, notice: 'ACH was successfully updated.' }
        format.json { render :show, status: :ok, location: @ach }
      else
        format.html { render :edit }
        format.json { render json: @ach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aches/1
  # DELETE /aches/1.json
  def destroy
    Ach.find(params[:id]).destroy
    respond_to do |format|
      if admin_signed_in?
        format.html { redirect_to aches_url, notice: 'ACH was successfully deleted' }
      else
        format.html { redirect_to current_user, notice: 'ACH was successfully deleted' }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ach
      @ach = Ach.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ach_params
      params.require(:ach).permit(:user_id, :bmn, :iso, :isoid, :agentname, :legalname, :taxid, :dba, :dbaddress, :maddress, :dbacity,
      :mcity, :dbastate, :dbazip, :mstate, :mzip, :bphone, :bfax, :contact, :title, :ownertype, :goodstype, :totalbustime,
      :locbustime, :webaddress, :email, :pname, :pphone, :ptitle, :pequity, :paddress, :pdob, :pcity, :pssn, :pstate, :pzip,
      :pdlicense)
    end
end
