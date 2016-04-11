class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :edit, :destroy]
  before_action :authenticate_user!, only: [:show]
  skip_before_action :authenticate_user!, if: :admin_signed_in?

  def index
    @users = User.all
  end

  def show
    @application = @user.application
    @ach = @user.ach
    @document = @user.document
  end

  def edit
  end

  def update
    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was updated" }
        format.json { render :show, status: :ok, location: @user }
      end
    end 
  end

  def destroy
    if current_admin.god_mode?
      @user.destroy
      respond_to do |format|
        format.html
        format.json { head :no_content }
        format.js
      end
    else
      respond_to do |format|
        format.js { render status: 403 }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :business, :phone)
    end
end
