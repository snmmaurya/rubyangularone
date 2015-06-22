class Programmers::SolutionsController < ApplicationController
	before_action :solution, only: [:edit, :update]
	before_action :meta
	def index
		if request.format.xls?
			@solutions = Solution.all
			response.headers['Content-Disposition'] = "attachment; filename= Solutions_#{Time.now.strftime("%d%m%Y%H%M%S")}.xls"
		else		
			@solutions = Kaminari.paginate_array(Solution.where(status: :ACTIVE)).page(params[:page]).per(params[:per_page] || 10)
		end
	end

	def new
		@solution = Solution.new
	end
	
	def create
		@solution = Solution.new(solution_params)
		if @solution.save
			flash[:notice] = "Added successfully"
			redirect_to programmers_solutions_path
		else
			render :new
		end	
	end

	def edit		
	end

	def update
		if @solution.update(solution_params)
			flash[:notice] = "Updated successfully"
			redirect_to programmers_solutions_path
		else
			render :edit
		end	
	end

	def solution
		@solution = Solution.friendly.find params[:id]
	end	

	def solution_params
		params.require(:solution).permit(:solution, :image, :description)
	end

	def meta
		@meta = set_meta_tags title: "SnmMaurya", description: "Ocean of Programming Solutions", keywords: ["Snm", "Maurya", "Ocean", "Solutions", "Programming", "Ruby", "Ruby On Rails"]
	end	 

	private :solution_params
end