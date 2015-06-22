class Administrator::TechnologiesController < ApplicationController
  before_action :technology, except: [:new, :create, :index]
  authorize_resource

  def index
    @technologies = Technology.all
    if params[:download].present?
      Download.initialize_background_download({filename: "Technology-#{Time.new.strftime("%m%d%Y%H%M%S")}", extension: "xls", title: :Technology, user: current_user, params: params})
      redirect_to downloads_path and return
    end
  end

  def show
  end
  
  def new
    @technology = Technology.new
    #authorize! :show, @project
  end

  def create
    @technology = current_user.technologies.build(technology_params)
    if @technology.save
      flash[:success] = "Created Successfully!"
      redirect_to administrator_technologies_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @technology.update(technology_params)
      flash[:success] = "Updated Successfully!"
      redirect_to administrator_technologies_path
    else
      render :edit
    end
  end

  def destroy
    if @technology.destroy
      flash[:success] = "Deleted Successfully!"
    else
      flash[:error] = "Unable to Delete!"
    end
    redirect_to administrator_technologies_path
  end

  def technology
    @technology = Technology.find params[:id]
  end
    
  protected
    def technology_params
      params.require(:technology).permit(:title, :tech_type)
    end
end
