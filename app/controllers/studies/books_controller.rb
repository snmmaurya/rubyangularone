class Studies::BooksController < ApplicationController
	before_action :book, except: [:index, :new, :create]

	def index
		@books = Book.all
	end

	def show
	end
	
	def new
		@book = Book.new
		#authorize! :show, @project
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			flash[:success] = "Created Successfully!"
			redirect_to studies_books_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @book.update(book_params)
			flash[:success] = "Updated Successfully!"
			redirect_to studies_books_path
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
		redirect_to studies_books_path
	end

	def book
		@book = Book.friendly.find params[:id]
	end
		
	protected
		def book_params
			params.require(:book).permit(:title, :image, :description)
		end	
end