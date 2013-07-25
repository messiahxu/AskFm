module SessionsHelper
  def sign_in(user)

    # 生成未加密的权标
    remember_token = User.new_remember_token
    # 将未加密的权标存入 cookies
    cookies[:remember_token] = { value: remember_token,
                                 expires: 1.month.from_now }
    # 将加密的权标存入 user 的 remember_token 字段
    user.update_attribute(:remember_token, User.encrypt(remember_token))

    #puts "puts self = #{self} self.current_user = #{self.current_user}"
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
    puts "self = #{self} self.current_user.nil? = #{self.current_user.nil?}"
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user?
    current_user == User.find(params[:id])
  end

  def set_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to]) || default
    session.delete(:return_to)
  end
end
