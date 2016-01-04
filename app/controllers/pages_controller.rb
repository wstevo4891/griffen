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
  end
end
