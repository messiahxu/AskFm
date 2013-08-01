module QuestionsHelper
  def owner_of(question)
    User.find(question.user_id)
  end

  def receiver_of(question)
    User.find(question.receiver_id)
  end
end
