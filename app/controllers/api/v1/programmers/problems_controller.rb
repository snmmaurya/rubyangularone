class Api::V1::Programmers::ProblemsController < Api::V1::BaseApiController
  def index
    render json: Problem.where(solution_id: params[:solution_id])
  end  
end