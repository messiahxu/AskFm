module QuestionsHelper
  def owner_of(item)
    User.find(item.user_id)
  end

  def receiver_of(item)
    User.find(item.receiver_id)
  end
end
