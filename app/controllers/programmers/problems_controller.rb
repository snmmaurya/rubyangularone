class Programmers::ProblemsController < ApplicationController	
	def index
		respond_to do |format|
			format.html
			format.js
			@solution = Solution.friendly.find params[:solution_id]
			@problems = @solution.problems.where(status: :ACTIVE)
			# if params[:keyword].present?				
			# 	#------------- solr search ----------------------#
			# 	Problem.search do
			# 		fulltext params[:keyword].downcase
			# 	end
			# 	#------------- solr search ----------------------#
			# end
			@problems = Kaminari.paginate_array(@problems.order(created_at: :desc)).page(params[:page]).per(params[:per_page] || 10)
			if params[:download]
				filepath = individual_problem(@problems, params[:title])				
				send_file( filepath, filename: "your_custom_file_name.pdf", type: "application/pdf") and return
			end
		end
	end

	def new
		respond_to do |format|
			format.js
			@solution = Solution.friendly.find params[:solution_id]
			@problem = @solution.problems.new
		end
	end

	def create
		respond_to do |format|
			format.js
			@solution = Solution.friendly.find params[:solution_id]
			@problem = @solution.problems.new(problem_params)
			@problem.save
		end
	end

	def edit
		respond_to do |format|
			format.js
			@solution = Solution.friendly.find params[:solution_id]
			@problem = Problem.friendly.find params[:id]
		end
	end

	def update
		respond_to do |format|
			format.js
			@solution = Solution.friendly.find params[:solution_id]
			@problem = Problem.friendly.find params[:id]
			@problem.update(problem_params)
		end
	end

	def destroy
		@solution = Solution.friendly.find params[:solution_id]			
		@problem = Problem.friendly.find params[:id]
		if @problem.destroy
			flash[:notice] = "Deleted!"
		else
			flash[:error] = "Unable to process!"
		end
		redirect_to programmers_solution_problems_path @solution
	end

=begin 
	Problem.search do
		fulltext 'best pizza'

	  with :blog_id, 1
	  with(:published_at).less_than Time.now
	  order_by :published_at, :desc
	  paginate :page => 2, :per_page => 15
	  facet :category_ids, :author_id
	end
=end	

	private
		def problem_params
			params.require(:problem).permit(:problem, :user_id)
		end			
end
