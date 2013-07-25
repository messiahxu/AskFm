class User < ActiveRecord::Base
  before_save { self.email.downcase! }
  before_create :create_remember_token

  # 昵称至少3个字没什么问题吧，最长15个字差不多了吧
  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }

  validates :email, presence: true, uniqueness: true

  # bio 250个字还不够？你要写自传吗？
  validates :bio, length: { maximum: 250 }

  # 一下这行生成了虚拟的 pasword 和 password_confirmation 属性，
  # 并且验证了添加了这两个属性的 presence 和相等于否
  # 之后把 password 加密存为 password_digest 属性
  # 还添加了一个 authenticate 方法用于登录，真是神迹啊！
  has_secure_password

  validates :password, length: { in: 6..30 }

  # 生成未加密的权标
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # 加密权标
  def User.encrypt(token)
    # 这里 token 一定要转成字符串，否则不晓得什么时候就会出问题
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
