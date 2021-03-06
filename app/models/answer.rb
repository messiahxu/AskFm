# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  content     :string(255)
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Answer < ActiveRecord::Base
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  belongs_to :user
  belongs_to :question
  has_one :notification, as: :notifiable

  after_create :send_notification

  def self.from_users_followed_by(user)
    followed_user_ids = user.followed_user_ids
    Answer.where("user_id IN (?) OR user_id = ?", followed_user_ids, user.id)
  end

  private 
    def send_notification
      self.create_notification(user_id: self.question.user_id)
    end
end
