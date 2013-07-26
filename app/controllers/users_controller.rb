class UsersController < ApplicationController
  before_action :signed_in_user?, only: [:edit, :update]
  before_action :correct_user?, only: [:edit, :update]

  def index
    #@users = User.all
    @users = User.order(:id).page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "注册成功"
      sign_in(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :bio, :password, :password_confirmation)
  end
  
  def signed_in_user?
    unless signed_in?
      set_location
      redirect_to signin_path, notice: "请登录先"
    end
  end

  def correct_user?
    unless current_user?
      redirect_to root_path, notice: "不要干坏事哦"
    end
  end

end
