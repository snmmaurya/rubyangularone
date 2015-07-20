class Api::V1::Programmers::ProblemsController < Api::V1::BaseApiController
  before_action :get_solution

  def index    
    @problems = Problem.where(solution_id: @solution.id).order(updated_at: :desc)#.offset("#{params[:begins] || 1}").limit("10")
    @total_problems = Problem.where(solution_id: @solution.id).count
    render json: {problems: @problems, total_problems: @total_problems}
  end

  def create
    @problem = @solution.problems.build(problem_params)
    @problem.user_id = current_user.id
    if @problem.save
      status = "OK"
    else
      status = "ERROR"
    end  
    render json: {status: status}
  end

  def show
    render json: (Problem.find params[:id])
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

  def get_solution
    @solution = Solution.friendly.find(params[:solution_id])
  end  
  
private  
  def problem_params
    params.require(:problem).permit(:problem)
  end
end