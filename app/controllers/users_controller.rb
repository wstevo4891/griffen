class UsersController < ApplicationController
  before_action :authenticate_user! || :authenticate_admin!, only: [:show]
  before_action :authenticate_admin!, only: [:index]

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
