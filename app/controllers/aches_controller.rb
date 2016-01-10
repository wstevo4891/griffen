class AchesController < ApplicationController
  before_action :set_ach, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index]
  before_action :authenticate_user! || :authenticate_admin!, except: [:index]

  # GET /aches
  # GET /aches.json
  def index
    @aches = Ach.all
  end
  
  def filename
    @ach.legalname
  end

  def save_path
    Rails.root.join('pdfs',"#{filename}.ACH_agreement.pdf")
  end

  def render_pdf
    render pdf: 'ACH_agreement',
           layout: 'pdf.html.erb',
           template: 'aches/edit.pdf.erb',
           wkhtmltopdf: 'bin/wkhtmltopdf',
           page_height: '47in',
           page_width: '12in'
  end

  def save_as_pdf
    pdf = render_to_string pdf: "ACH_agreement.pdf", 
                           layout: 'pdf.html.erb', 
                           template: "aches/edit.pdf.erb", 
                           encoding: "UTF-8", 
                           wkhtmltopdf: 'bin/wkhtmltopdf', 
                           page_height: '47in', 
                           page_width: '12in'
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
  end

  def dropbox_upload(bool)
    file = open(save_path)  
    client = DropboxClient.new(OAUTH2_ACCESS_TOKEN)
    response = client.put_file('Applications/ACH/' + filename + '.ACH_agreement.pdf', file, overwrite=bool)
  end

  # GET /aches/1
  # GET /aches/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render_pdf
      end
    end
  end

  # GET /aches/new
  def new
    @ach = Ach.new
  end

  # GET /aches/1/edit
  def edit
    respond_to do |format|
      format.html
      format.pdf do
        render_pdf
      end
    end               
  end

  # POST /aches
  # POST /aches.json
  def create
    @ach = Ach.new(ach_params)
    respond_to do |format|
      if @ach.save
        save_as_pdf 
        dropbox_upload(false)
        if admin_signed_in?
          format.html { redirect_to aches_url, notice: 'ACH Agreement was successfully completed' }
        else
          format.html { redirect_to current_user, notice: 'ACH Agreement was successfully completed' }
        end
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
    respond_to do |format|
      if @ach.update_attributes(ach_params)
        save_as_pdf    
        dropbox_upload(true)
        if admin_signed_in?
          format.html { redirect_to aches_url, notice: 'ACH was successfully updated' }
        else
          format.html { redirect_to current_user, notice: 'ACH was successfully updated' }
        end
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
    @ach.destroy
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
