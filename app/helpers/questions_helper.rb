module QuestionsHelper
  def owner_of(question)
    User.find(question.user_id)
  end
end
