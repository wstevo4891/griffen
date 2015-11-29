class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password]) and user[:admin]
      session[:user_id] = user.id
      redirect_to admin_url
    elsif user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user  
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Logged out"
  end
end

