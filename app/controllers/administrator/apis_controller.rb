class Administrator::ApisController < ApplicationController
  before_action :api, except: [:new, :create, :index]
  authorize_resource

  def index
    @apis = Api.all
    if params[:download].present?
      Download.initialize_background_download({filename: "Api-#{Time.new.strftime("%m%d%Y%H%M%S")}", extension: "xls", title: :Api, user: current_user, params: params})
      redirect_to downloads_path and return
    end
  end

  def show
  end
  
  def new
    @api = Api.new
    #authorize! :show, @project
  end

  def create
    @api = current_user.apis.build(api_params)
    if @api.save
      flash[:success] = "Created Successfully!"
      redirect_to administrator_apis_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @api.update(api_params)
      flash[:success] = "Updated Successfully!"
      redirect_to administrator_apis_path
    else
      render :edit
    end
  end

  def destroy
    if @api.destroy
      flash[:success] = "Deleted Successfully!"
    else
      flash[:error] = "Unable to Delete!"
    end
    redirect_to administrator_apis_path
  end

  def api
    @api = Api.find params[:id]
  end
    
  protected
    def api_params
      params.require(:api).permit(:title)
    end
end
