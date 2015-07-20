class Api::V1::Programmers::AnswersController < Api::V1::BaseApiController
  before_action :get_problem
  def index
    @answers = Answer.where(problem_id: @problem.id)
    render json: @answers
  end

  def create
    @answer = @problem.answers.build(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      status = "OK"
    else
      status = "ERROR"
    end  
    render json: {status: status}
  end

  def update
    @answer = Answer.friendly.find params[:id]
    if @answer.update(answer_params)
      status = "OK"
    else
      status = "ERROR"
    end
    render json: {status: status}
  end

  def get_problem
    @problem = Problem.friendly.find(params[:problem_id])
  end  
  
private
  def answer_params
    params.require(:answer).permit(:answer)
  end 
end