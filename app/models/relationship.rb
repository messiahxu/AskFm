# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates_presence_of :follower_id, :followed_id
end
