class Api::V1::Programmers::AnswersController < Api::V1::BaseApiController
  def index
    render json: Answer.where(problem_id: params[:problem_id])
  end  
end