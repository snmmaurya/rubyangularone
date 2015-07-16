class Api::V1::Programmers::ProblemsController < Api::V1::BaseApiController
  def index
    @problems = Problem.where(solution_id: params[:solution_id]).order(updated_at: :asc).offset("#{params[:begins] || 1}").limit("10")
    @total_problems = Problem.where(solution_id: params[:solution_id]).count
    render json: {problems: @problems, total_problems: @total_problems}
  end

  def create
    @solution = Solution.find params[:solution_id]
    @problem = @solution.problems.build(problem_params)
    @problem.user_id = current_user.id
    if @problem.save
      status = "OK"
    else
      status = "ERROR"
    end  
    render json: {status: status}
  end

  def update
    @problem = Problem.find params[:id]
    if @problem.update(problem_params)
      status = "OK"
    else
      status = "ERROR"
    end
    render json: {status: status}
  end  
  
private  
  def problem_params
    params.require(:problem).permit(:problem)
  end
end