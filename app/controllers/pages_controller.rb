class PagesController < ApplicationController
  before_action :authenticate_admin!, only: [:admin]

  def welcome
  end

  def about
  end
  
  def products
  end
  
  def contact
  end
  
  def admin
    @total_orders = Order.count
    @current_date = Time.now.strftime("%A, %b %d, %Y")
    @current_time = Time.now.strftime("%I:%M %p")
  end
end
