class Hospitals::DoctorsController < ApplicationController
  before_action :doctor, except: [:new, :create, :index]
  authorize_resource

  def index
    @doctors = Doctor.all
    if params[:download].present?
      Download.initialize_background_download({filename: "Doctor-#{Time.new.strftime("%m%d%Y%H%M%S")}", extension: "xls", title: :Doctor, user: current_user, params: params})
      redirect_to downloads_path and return
    end
  end

  def show
  end
  
  def new
    @doctor = Doctor.new({name: current_user.infos.first.fname, email: current_user.email, address: current_user.infos.first.address, description: current_user.infos.first.about_yourself})
    #authorize! :show, @project
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      image = params[:image].present? ? params[:image] : "#{Rails.root}#{current_user.image_url}"
      picture = @doctor.pictures.build({image: image})
      picture.save
      flash[:success] = "Created Successfully!"
      redirect_to hospitals_doctors_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @doctor.update(doctor_params)
      if params[:image].present?
        @doctor.pictures.last.update_attributes({image: params[:image]})
        # @doctor.pictures.build({image: params[:image]}).save
      end
      binding.pry
      flash[:success] = "Updated Successfully!"
      redirect_to hospitals_doctors_path
    else
      render :edit
    end
  end

  def destroy
    if @doctor.destroy
      flash[:success] = "Deleted Successfully!"
    else
      flash[:error] = "Unable to Delete!"
    end
    redirect_to hospitals_doctors_path
  end

  def doctor
    @doctor = Doctor.find params[:id]
  end
    
  protected
    def doctor_params
      params.require(:doctor).permit(:name, :email, :address, :practice, :description)
    end
end
