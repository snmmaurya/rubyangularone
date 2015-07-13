class Api::V1::Programmers::AnswersController < Api::V1::BaseApiController
  def index
    @answers = Answer.where(problem_id: params[:problem_id])
    render json: @answers
  end

  def create
    @problem = Problem.find params[:problem_id]
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
    @answer = Answer.find params[:id]
    if @answer.update(answer_params)
      status = "OK"
    else
      status = "ERROR"
    end
    render json: {status: status}
  end  
  
private  
  def answer_params
    params.require(:answer).permit(:answer)
  end 
end