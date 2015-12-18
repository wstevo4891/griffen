class PagesController < ApplicationController
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
  end
end
