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
end
