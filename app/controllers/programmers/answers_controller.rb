class Programmers::AnswersController < ApplicationController
	def index
		respond_to do |format|
			format.html
			format.js
			@solution = Solution.friendly.find params[:solution_id]
			@problem = Problem.friendly.find params[:problem_id]
			@answers = @problem.answers			
			if params[:keyword].present?				
				@answers = @answers.where("LOWER(answers.answer) like '%#{params[:keyword].downcase}%'")
			end
			@answers = Kaminari.paginate_array(@answers.order(created_at: :desc)).page(params[:page]).per(params[:per_page] || 10)
		end
	end

	def new
		respond_to do |format|
			format.js
			@solution = Solution.friendly.find params[:solution_id]
			@problem = Problem.friendly.find params[:problem_id]
			@answer = @problem.answers.new
		end
	end

	def create
		respond_to do |format|
			format.js
			@solution = Solution.friendly.find params[:solution_id]
			@problem = Problem.friendly.find params[:problem_id]
			@answer = @problem.answers.new(answer_params)
			@answer.save
		end
	end

	def edit
		respond_to do |format|
			format.html
			format.js
			@solution = Solution.friendly.find params[:solution_id]
			@problem = Problem.friendly.find params[:problem_id]
			@answer = Answer.friendly.find params[:id]
		end		
	end

	def update
		respond_to do |format|
			format.js
			@solution = Solution.friendly.find params[:solution_id]
			@problem = Problem.friendly.find params[:problem_id]
			@answer = @problem.answers.friendly.find params[:id]
			@answer.update(answer_params)
		end
	end

	def destroy
		@solution = Solution.friendly.find params[:solution_id]
		@problem = Problem.friendly.find params[:problem_id]
		@answer = Answer.friendly.find params[:id]
		if @answer.destroy
			flash[:notice] = "Deleted!"
		else
			flash[:error] = "Unable to process!"
		end
		redirect_to programmers_solution_problem_answer_path @solution, @problem
	end	

	private
		def answer_params
			params.require(:answer).permit(:answer, :user_id)
		end
end