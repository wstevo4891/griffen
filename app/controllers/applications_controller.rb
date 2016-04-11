class ApplicationsController < ApplicationController
  before_action :set_user, except: [:filename, :save_path, :render_pdf, :save_as_pdf]
  before_action :set_application, only: [:show, :edit, :update, :submit, :destroy]
  before_action :authenticate_admin!, only: [:index]
  before_action :authenticate_user!, except: [:index]
  skip_before_action :authenticate_user!, if: :admin_signed_in?

  def filename
    @application.oname
  end

  def save_path
    Rails.root.join('pdfs',"#{filename}.merchant_application.pdf")
  end

  def render_pdf
    render pdf: 'merchant_application',   # Excluding ".pdf" extension.
        layout: 'pdf.html.erb',
      template: 'applications/edit.pdf.erb',
   wkhtmltopdf: 'bin/wkhtmltopdf',
   page_height: '75in',
    page_width: '12em'
  end

  def save_as_pdf
    pdf = render_to_string pdf: "merchant_application.pdf", 
                        layout: 'pdf.html.erb', 
                      template: "applications/edit.pdf.erb", 
                      encoding: "UTF-8", 
                   wkhtmltopdf: 'bin/wkhtmltopdf', 
                   page_height: '75in', 
                    page_width: '12em'
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render_pdf
      end         
    end  
  end

  # GET /applications/new
  def new
    @application = @user.build_application
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = @user.create_application(application_params)

    respond_to do |format|
      if @application.save   
        # applicationNotifier.received(@application).deliver_now
        format.html { redirect_to user_path(@user), notice: "Thank you for completing the merchant application" }
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
      if @application.update(application_params)
        if admin_signed_in?
          format.html { redirect_to admin_applications_url, notice: 'Application was successfully updated' }
        else        
          format.html { redirect_to current_user, notice: 'Application was successfully updated' }
        end
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def submit
    save_as_pdf
    file = open(save_path)  
    client = DropboxClient.new(OAUTH2_ACCESS_TOKEN)
    response = client.put_file('Applications/Merchant/' + filename + '.merchant_application.pdf', file, overwrite=true)
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    if admin_signed_in?
      redirect_to admin_applications_path
    else
      redirect_to user_path(@user)
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
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_application
      @application = @user.application
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:legalname, :dba, :address,
      :baddress, :city, :state, :bcity, :bstate, :zip, :bzip, :phone, :fax,
      :bphone, :bfax, :ftin, :email, :contact, :oname, :dob, :ssn, :ophone,
      :oaddress, :ocity, :ostate, :ozip, :avgt, :monv, :maxta, :qc, :tz, :pref,
      :prefn, :cw, :pl, :osig, :date, :sasig, :agentid, :iso, :dialup, :dumi,
      :dualcom, :dcmi, :msf12mi, :mi610, :mcfmi, :msf8mi, :carch, :carchmi,
      :confmi, :incrmi, :billmail, :billosig, :billdate, :billpn, :bankname,
      :bankaccount, :bankphone, :voidcheck, :voidcheck_cache, :dlicense,
      :dlicense_cache, :mtosig, :mtot, :mtdate, :mtpn, :mtsasig, :mtagentid,
      :mtiso, :yname, :fname, :faddress, :fcity, :fstate, :fzip, :fphone, :facc,
      :frn, :fan, :atype, :coname, :coatt, :coaddress, :cocity, :costate,
      :cozip, :cophone, :comail, :cosig, :codate, :verby, :appby)
    end
end
