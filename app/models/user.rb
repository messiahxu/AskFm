# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  bio             :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  before_save { self.email.downcase! }
  before_create :create_remember_token

  # 昵称最长15个字差不多了吧
  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }

  validates :email, presence: true, uniqueness: true

  # bio 150个字还不够？你要写自传吗？
  validates :bio, length: { maximum: 150 }

  # 这行生成了虚拟的 pasword 和 password_confirmation 属性，
  # 并且验证了添加了这两个属性的 presence 和相等于否
  # 之后把 password 加密存为 password_digest 属性
  # 还添加了一个 authenticate 方法用于登录，真是神迹啊！
  has_secure_password

  validates :password, length: { in: 6..30 }

  # has_many :questions, dependent: :destroy
  has_many :questions, foreign_key: "user_id", dependent: :destroy
  has_many :receive_questions, foreign_key: "receiver_id", class_name: "Question", dependent: :destroy


  has_many :answers, dependent: :destroy

  # relationships
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  def following?(other_user)
    self.followed_users.find_by(id: other_user.id)
  end

  def follow!(other_user)
    self.relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    self.relationships.find_by(followed_id: other_user.id).destroy
  end

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
