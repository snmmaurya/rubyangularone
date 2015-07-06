class Api::V1::Programmers::SolutionsController < Api::V1::BaseApiController
  def index
    render json: Solution.all
  end  
end