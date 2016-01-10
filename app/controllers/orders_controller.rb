class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index]
  before_action :authenticate_user! || :authenticate_admin!, except: [:index]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  def filename
    @order.business
  end

  def save_path
    Rails.root.join('pdfs',"#{filename}.order.pdf")
  end

  def render_pdf
    render pdf: 'order',   # Excluding ".pdf" extension.
         layout: 'pdf.html.erb',
         template: 'orders/edit.pdf.erb',
         wkhtmltopdf: 'bin/wkhtmltopdf',
         page_height: '20in',
         page_width: '12em'
  end

  def save_as_pdf
    pdf = render_to_string pdf: "order.pdf", 
                         layout: 'pdf.html.erb', 
                         template: "orders/edit.pdf.erb", 
                         encoding: "UTF-8", 
                         wkhtmltopdf: 'bin/wkhtmltopdf', 
                         page_height: '20in', 
                         page_width: '12em'
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
  end

  def dropbox_upload(bool)
    file = open(save_path)  
    client = DropboxClient.new(OAUTH2_ACCESS_TOKEN)
    response = client.put_file('Applications/Orders/' + filename + '.merchant_application.pdf', file, overwrite=bool)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render_pdf
      end         
    end 
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    respond_to do |format|
      format.html
      format.pdf do
        render_pdf
      end         
    end 
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        save_as_pdf
        dropbox_upload(false)
        if admin_signed_in?
          format.html { redirect_to orders_url, notice: 'Order was successfully created' }
        else
          format.html { redirect_to current_user, notice: 'Your order has been processed' }
        end
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update_attributes(order_params)
        save_as_pdf
        dropbox_upload(true)
        if admin_signed_in?
          format.html { redirect_to orders_url, notice: 'Order was successfully updated' }
        else
          format.html { redirect_to current_user, notice: 'Order was successfully updated' }
        end
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      if admin_signed_in?
        format.html { redirect_to orders_url, notice: 'Order was deleted' }
      else
        format.html { redirect_to current_user, notice: 'Order was deleted' }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :name, :business, :email, :phone)
    end
end
