class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user) 
      flash[:success] = "登录成功"
      redirect_to profile_path
    else
      flash.now[:error] = "邮箱或密码错误"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
