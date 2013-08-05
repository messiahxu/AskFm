module NotificationsHelper
  def question_of(notification)
    Question.find(notification.notifiable_id)
  end

  def answer_of(notification)
    Answer.find(notification.notifiable_id)
  end
end
