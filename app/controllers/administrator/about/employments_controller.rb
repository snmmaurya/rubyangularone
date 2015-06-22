class Administrator::About::EmploymentsController < ApplicationController
	before_action :employment, except: [:new, :create, :index]
	authorize_resource
	# load_and_authorize_resource
 	# skip_authorize_resource :only => :new


	def index
		@employments = Employment.all
		if params[:download].present?
			Download.initialize_background_download({filename: "employment-#{Time.new.strftime("%m%d%Y%H%M%S")}", extension: "xls", title: :Employment, user: current_user, params: params})
			redirect_to downloads_path and return
		end
	end

	def show
	end
	
	def new
		@employment = Employment.new
		#authorize! :show, @project
	end

	def create
		@employment = Employment.new(employment_params)
		if @employment.save
			flash[:success] = "Created Successfully!"
			redirect_to administrator_about_employments_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @employment.update(employment_params)
			flash[:success] = "Updated Successfully!"
			redirect_to administrator_about_employments_path
		else
			render :edit
		end
	end

	def destroy
		if @employment.destroy
			flash[:success] = "Deleted Successfully!"
		else
			flash[:error] = "Unable to Delete!"
		end
		redirect_to administrator_about_employments_path
	end

	def employment
		@employment = Employment.find params[:id]
	end
		
	protected
		def  	employment_params
			params.require(:employment).permit(:title, :image, :url, :tools, :description)
		end	
end