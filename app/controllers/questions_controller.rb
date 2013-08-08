class QuestionsController < ApplicationController
  before_action :signed_in_user?, only: [:index, :need_to_answer, :reply, :create]
  def index
    # 这个 action 是列出用户提出的问题
    @questions = current_user.questions.page(params[:page]).per(20)
  end

  def need_to_answer
    # 这个 action 是列出用户收到的问题
    @receive_questions = current_user.receive_questions.where(replied: false)
  end

  def create
    @user = current_user
    @question = @user.questions.create(content: params[:question][:content],
                                       receiver_id: params[:user_id]
                                      )
    redirect_to User.find(params[:user_id])
  end

  def reply
    @question = Question.find(params[:id])
    if @question.replied?
      flash[:notice] = "那个问题已经回答过咯"
      redirect_to root_path
    end
    @answer = @question.build_answer
  end

end
