# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  content     :string(255)
#  user_id     :integer
#  receiver_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  replied     :boolean          default(FALSE)
#

class Question < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true
  validates :receiver_id, presence: true
  belongs_to :user
  #belongs_to :sender, class_name: "User", foreign_key: "user_id"
  #belongs_to :receiver, class_name: "User"
  has_one :answer, dependent: :destroy
end
