class AnswersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @answer = Answer.find(params[:id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.build_answer(content: params[:answer][:content],
                                     user_id: current_user.id
                                    )
    if @answer.save
      @question.update_attribute(:replied, true)
      redirect_to need_to_answer_path
    else
      flash[:notice] = "不知道为什么，答案提交失败了……"
      #redirect_to reply_path(@question)
      render "questions/reply"
    end
  end

end
