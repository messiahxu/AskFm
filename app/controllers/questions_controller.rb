class QuestionsController < ApplicationController
  #def index
  #  # 列出当前用户收到的所有问题
  #  @questions = Question.where(receiver_id: current_user.id).order("id DESC")
  #end

  def create
    @user = current_user
    @question = @user.questions.create(content: params[:question][:content],
                                       receiver_id: params[:user_id]
                                      )
    redirect_to User.find(params[:user_id])
  end
end
