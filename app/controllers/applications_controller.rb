class ApplicationsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.all
  end
  
  def filename
    @application.oname
  end
  
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end  

  # GET /applications/1
  # GET /applications/1.json
  def show
    @application = Application.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'merchant_application',   # Excluding ".pdf" extension.
               layout: 'pdf.html.erb',
               template: 'applications/show.pdf.erb',
               wkhtmltopdf: 'bin/wkhtmltopdf',
               page_height: '105in',
               page_width: '10em'
      end         
    end  
  end

  # GET /applications/new
  def new    
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit
    @application = Application.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'merchant_application',   # Excluding ".pdf" extension.
               layout: 'pdf.html.erb',
               template: 'applications/edit.pdf.erb',
               wkhtmltopdf: 'bin/wkhtmltopdf',
               page_height: '105in',
               page_width: '10em'
      end         
    end 
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)

    respond_to do |format|
      if @application.save
        pdf = render_to_string pdf: "merchant_application.pdf", 
        layout: 'pdf.html.erb', 
        template: "applications/edit.pdf.erb", 
        encoding: "UTF-8", 
        wkhtmltopdf: 'bin/wkhtmltopdf', 
        page_height: '105in', 
        page_width: '10em'
        save_path = Rails.root.join('pdfs',"#{filename}.merchant_application.pdf")
        File.open(save_path, 'wb') do |file|
          file << pdf
        end
        file = open(save_path)  
        client = DropboxClient.new(OAUTH2_ACCESS_TOKEN)
        response = client.put_file('Applications/' + filename + '.merchant_application.pdf', file)         
        applicationNotifier.received(@application).deliver_now
        format.html { redirect_to current_user, notice: "Thank you for completing the merchant application" }
        format.json { render :show, status: :created, location: @application }  
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
        pdf = render_to_string pdf: "merchant_application.pdf", 
        layout: 'pdf.html.erb', 
        template: "applications/edit.pdf.erb", 
        encoding: "UTF-8", 
        wkhtmltopdf: 'bin/wkhtmltopdf', 
        page_height: '105in', 
        page_width: '10em'
        save_path = Rails.root.join('pdfs',"#{filename}.merchant_application.pdf")
        File.open(save_path, 'wb') do |file|
          file << pdf
        end  
        file = open(save_path)  
        client = DropboxClient.new(OAUTH2_ACCESS_TOKEN)
        response = client.put_file('Applications/' + filename + '.merchant_application.pdf', file, overwrite=true)             
      if @application.update(application_params)
        format.html { redirect_to current_user, notice: 'application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def upload
    uploaded_io = params[:application][:voidcheck, :dlicense]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:user_id, :legalname, :dba, :address, :baddress, :city, :state, :bcity, :bstate, :zip, :bzip,
      :phone, :fax, :bphone, :bfax, :ftin, :email, :contact, :oname, :dob, :ssn, :ophone, :oaddress, :ocity, :ostate,
      :ozip, :avgt, :monv, :maxta, :qc, :tz, :pref, :prefn, :cw, :pl, :osig, :date, :sasig, :agentid, :iso, :dialup,
      :dumi, :dualcom, :dcmi, :msf12mi, :mi610, :mcfmi, :msf8mi, :carch, :carchmi, :confmi, :incrmi, :billmail, :billosig,
      :billdate, :billpn, :bankname, :bankaccount, :bankphone, :voidcheck, :voidcheck_cache, :dlicense, :dlicense_cache, :mtosig, :mtot, :mtdate, :mtpn,
      :mtsasig, :mtagentid, :mtiso, :yname, :fname, :faddress, :fcity, :fstate, :fzip, :fphone, :facc, :frn, :fan, :atype,
      :coname, :coatt, :coaddress, :cocity, :costate, :cozip, :cophone, :comail, :cosig, :codate, :verby, :appby)
    end
end
