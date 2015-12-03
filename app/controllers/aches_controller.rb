class AchesController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]
  before_action :set_ach, only: [:show, :edit, :update, :destroy]

  # GET /aches
  # GET /aches.json
  def index
    @aches = Ach.all
  end
  
  def filename
    @ach.legalname
  end  
  
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end  

  # GET /aches/1
  # GET /aches/1.json
  def show
  end

  # GET /aches/new
  def new
    @ach = @user.ach.new
  end

  # GET /aches/1/edit
  def edit
    @ach = Ach.find(params[:user_id])
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
    @ach = @user.ach.new(ach_params)

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
    respond_to do |format|
      if @ach.update(ach_params)
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
    @ach.destroy
    respond_to do |format|
      format.html { redirect_to aches_url, notice: 'ACH was successfully destroyed.' }
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
