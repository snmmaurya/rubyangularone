class Administrator::PortfoliosController < ApplicationController
	before_action :get_portfolio, except: [:new, :create, :index]
	authorize_resource
	# load_and_authorize_resource
 	# skip_authorize_resource :only => :new


	def index
		@portfolios = Portfolio.all
		if params[:download].present?
			Download.initialize_background_download({filename: "Portfolio-#{Time.new.strftime("%m%d%Y%H%M%S")}", extension: "xls", title: :Portfolio, user: current_user, params: params})
			redirect_to downloads_path and return
		end
	end

	def show
	end
	
	def new
		@portfolio = Portfolio.new
		#authorize! :show, @project
	end

	def create
		@portfolio = Portfolio.new(portfolio_params)
		if @portfolio.save
			flash[:success] = "Created Successfully!"
			redirect_to administrator_portfolios_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @portfolio.update(portfolio_params)
			flash[:success] = "Updated Successfully!"
			redirect_to administrator_portfolios_path
		else
			render :edit
		end
	end

	def destroy
		if @portfolio.destroy
			flash[:success] = "Deleted Successfully!"
		else
			flash[:error] = "Unable to Delete!"
		end
		redirect_to administrator_portfolios_path
	end

	def get_portfolio
		@portfolio = Portfolio.find params[:id]
	end
		
	protected
		def  	portfolio_params
			params.require(:portfolio).permit(:title, :image, :url, :tools, :description)
		end	
end