class Api::V1::Programmers::ProblemsController < Api::V1::BaseApiController
  def index
    @problems = Problem.where(solution_id: params[:solution_id]).offset("#{params[:begins] || 1}").limit("2")
    @total_problems = Problem.where(solution_id: params[:solution_id]).count
    render json: @problems
  end
end