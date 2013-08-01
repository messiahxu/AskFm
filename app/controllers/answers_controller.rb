class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.build_answer(content: params[:answer][:content],
                                     user_id: current_user.id
                                    )
    if @answer.save
      @question.update_attribute(:replied, true)
      redirect_to need_to_answer_path
    else
      flash[:notice] = "答案好像被抓走了……"
      redirect_to reply_path(@question)
    end
  end

  private
    def signed_in_user?
    end
end
