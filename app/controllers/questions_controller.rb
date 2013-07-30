class QuestionsController < ApplicationController
  def index
    # 列出当前用户收到的所有问题
    @questions = Question.where(receiver_id: current_user.id).order("id DESC")
  end

  def new
  end
end
