class Studies::LessionsController < ApplicationController
	before_action :initialiaze_book
	before_action :initialiaze_lession, except: [:index, :new, :create]
	before_action :initialiaze_lessions, only: [:index, :show]

	def index
		@book= Book.friendly.find params[:book_id]
	end

	def show
		if params[:download]
			filepath = individual_lession(@lession, @lession.title)
			Download.initialize_background_download({filename: "Portfolio-#{Time.new.strftime("%m%d%Y%H%M%S")}", extension: "xls", title: :Portfolio, user: current_user, params: params})
			redirect_to downloads_path and return
			send_file( filepath, filename: "#{@lession.title}.pdf", type: "application/pdf")
		end
	end
	
	def new
		@lession = Lession.new
		#authorize! :show, @project
	end

	def create
		@lession = @book.lessions.build(lession_params)
		if @lession.save
			flash[:success] = "Created Successfully!"
			redirect_to studies_book_lessions_path(@book)
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @lession.update(lession_params)
			flash[:success] = "Updated Successfully!"
			redirect_to studies_book_lessions_path(@book)
		else
			render :edit
		end
	end

	def destroy
		if @book.destroy
			flash[:success] = "Deleted Successfully!"
		else
			flash[:error] = "Unable to Delete!"
		end
		redirect_to studies_book_lessions_path(@book)
	end

	def initialiaze_book
		@book = Book.friendly.find params[:book_id]
	end

	def initialiaze_lession
		@lession = Lession.friendly.find params[:id]
		# @lession = @book.lessions.where(id: params[:id]).first
	end
	
	def initialiaze_lessions
		@lessions = @book.lessions
	end
		
	protected
		def  lession_params
			params.require(:lession).permit(:book_id, :title, :description)
		end	
end