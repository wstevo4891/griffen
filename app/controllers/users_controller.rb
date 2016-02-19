class UsersController < ApplicationController
  before_action :authenticate_admin!, only: :index
  before_action :authenticate_user!, except: :index
  skip_before_action :authenticate_user!, if: :admin_signed_in?

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def application
  	@application = @user.application
  end

  def ach
  	@ach = @user.ach
  end

  def document
  	@document = @user.document
  end

  def order
    @order = @user.order
  end
end
