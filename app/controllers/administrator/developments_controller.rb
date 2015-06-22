class Administrator::DevelopmentsController < ApplicationController
  before_action :development, except: [:new, :create, :index]
  authorize_resource

  def index
    @developments = Development.all
    if params[:download].present?
      Download.initialize_background_download({filename: "Development-#{Time.new.strftime("%m%d%Y%H%M%S")}", extension: "xls", title: :Development, user: current_user, params: params})
      redirect_to downloads_path and return
    end
  end

  def show
  end
  
  def new
    @development = Development.new
    #authorize! :show, @project
  end

  def create
    @development = current_user.developments.build(development_params)
    if @development.save
      flash[:success] = "Created Successfully!"
      redirect_to administrator_developments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @development.update(development_params)
      flash[:success] = "Updated Successfully!"
      redirect_to administrator_developments_path
    else
      render :edit
    end
  end

  def destroy
    if @development.destroy
      flash[:success] = "Deleted Successfully!"
    else
      flash[:error] = "Unable to Delete!"
    end
    redirect_to administrator_developments_path
  end

  def development
    @development = Development.find params[:id]
  end
    
  protected
    def development_params
      params.require(:development).permit(:title, :dev_type)
    end
end
