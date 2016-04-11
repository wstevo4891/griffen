class AchesController < ApplicationController
  before_action :set_user, except: [:filename, :save_path, :render_pdf, :save_as_pdf]
  before_action :set_ach, only: [:show, :edit, :update, :submit, :destroy]
  before_action :authenticate_admin!, only: [:index]
  before_action :authenticate_user!, except: [:index]
  skip_before_action :authenticate_user!, if: :admin_signed_in?
 
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

  def submit
    save_as_pdf
    file = open(save_path)  
    client = DropboxClient.new(OAUTH2_ACCESS_TOKEN)
    response = client.put_file('Applications/ACH/' + filename + '.ACH_agreement.pdf', file, overwrite=true)
  end

  # GET /aches/1
  # GET /aches/1.json
  def show
  end

  # GET /aches/new
  def new
    @ach = @user.build_ach
  end

  # GET /aches/1/edit
  def edit              
  end

  # POST /aches
  # POST /aches.json
  def create
    @ach = @user.create_ach(ach_params)
    respond_to do |format|
      if @ach.save
        format.html { redirect_to user_path(@user), notice: 'Thank you for completing the ACH Agreement' }
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
    if admin_signed_in?
      redirect_to admin_applications_path
    else
      redirect_to user_path(@user)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_ach
      @ach = @user.ach
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ach_params
      params.require(:ach).permit(:bmn, :iso, :isoid, :agentname, :legalname, :taxid, 
        :dba, :dbaddress, :maddress, :dbacity, :mcity, :dbastate, :dbazip, :mstate, 
        :mzip, :bphone, :bfax, :contact, :title, :ownertype, :goodstype, :totalbustime,
        :locbustime, :webaddress, :email, :pname, :pphone, :ptitle, :pequity, :paddress, 
        :pdob, :pcity, :pssn, :pstate, :pzip, :pdlicense)
    end
end
