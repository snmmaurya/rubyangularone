class Administrator::EducationsController < ApplicationController
  before_action :education, except: [:new, :create, :index]
  authorize_resource

  def index
    @educations = Education.all
    if params[:download].present?
      Download.initialize_background_download({filename: "Education-#{Time.new.strftime("%m%d%Y%H%M%S")}", extension: "xls", title: :Education, user: current_user, params: params})
      redirect_to downloads_path and return
    end
  end

  def show
  end
  
  def new
    @education = Education.new
    #authorize! :show, @project
  end

  def create
    @education = current_user.educations.build(education_params)
    if @education.save
      flash[:success] = "Created Successfully!"
      redirect_to administrator_educations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @education.update(education_params)
      flash[:success] = "Updated Successfully!"
      redirect_to administrator_educations_path
    else
      render :edit
    end
  end

  def destroy
    if @education.destroy
      flash[:success] = "Deleted Successfully!"
    else
      flash[:error] = "Unable to Delete!"
    end
    redirect_to administrator_educations_path
  end

  def education
    @education = Education.find params[:id]
  end
    
  protected
    def education_params
      params.require(:education).permit(:title, :school, :status, :started_at, :completed_at, :description)
    end
end