class QuestionsController < ApplicationController
  before_action :signed_in_user?, only: [:index, :need_to_answer, :reply, :create]
  def index
    # 这个 action 是列出用户提出的问题
    @questions = current_user.questions
  end

  def need_to_answer
    # 这个 action 是列出用户收到的问题
    @questions = Question.where(receiver_id: current_user.id)
  end

  def create
    @user = current_user
    @question = @user.questions.create(content: params[:question][:content],
                                       receiver_id: params[:user_id]
                                      )
    redirect_to User.find(params[:user_id])
  end

  def reply
    # @user = current_user
    @question = Question.find(params[:id])
    @answer = @question.build_answer
  end

  private
    def signed_in_user?
      unless signed_in?
        set_location
        redirect_to signin_path, notice: "请登录先"
      end
    end
end
