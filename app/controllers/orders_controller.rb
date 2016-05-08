class OrdersController < ApplicationController
  before_action :set_user, except: [:save_path, :render_pdf, :save_as_pdf, :dropbox_upload]
  before_action :set_order, only: [:show, :edit, :update, :destroy, :filename, :dropbox_upload]
  before_action :authenticate_admin!, unless: :user_signed_in?
  before_action :authenticate_user!, unless: :admin_signed_in?


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
    @order = @user.orders.build
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
    @order = @user.orders.create(order_params)

    respond_to do |format|
      if @order.save
        dropbox_upload(false)
        if admin_signed_in?
          format.html { redirect_to admin_orders_url, notice: 'Order was successfully created' }
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
      if @order.update(order_params)
        dropbox_upload(true)
        if admin_signed_in?
          format.html { redirect_to admin_orders_url, notice: 'Order was successfully updated' }
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
    @user.orders.destroy(@order)
    if admin_signed_in?
      redirect_to admin_orders_url
    else
      redirect_to user_path(@user)
    end
  end

  def filename
    @order.user_id.to_s + "_" + @order.business
  end

  def save_path
    Rails.root.join('tmp',"#{filename}.order.pdf")
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
    save_as_pdf
    file = open(save_path)  
    client = DropboxClient.new(OAUTH2_ACCESS_TOKEN)
    response = client.put_file('Applications/Orders/' + filename + '.merchant_application.pdf', file, overwrite=bool)
    File.delete(save_path)
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :business, :email, :phone, :product, :payment)
    end
end
