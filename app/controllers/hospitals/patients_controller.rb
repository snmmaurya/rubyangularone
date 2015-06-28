class Hospitals::PatientsController < ApplicationController
  before_action :patient, except: [:new, :create, :index]
  authorize_resource

  def index
    @patients = Patient.all
    if params[:download].present?
      Download.initialize_background_download({filename: "Patient-#{Time.new.strftime("%m%d%Y%H%M%S")}", extension: "xls", title: :Patient, user: current_user, params: params})
      redirect_to downloads_path and return
    end
  end

  def show
  end
  
  def new
    @patient = Patient.new({name: current_user.infos.first.fname, email: current_user.email, address: current_user.infos.first.address, description: current_user.infos.first.about_yourself})
    #authorize! :show, @project
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      image = params[:image].present? ? params[:image] : "#{Rails.root}#{current_user.image_url}"
      picture = @patient.pictures.build({image: image})
      picture.save
      flash[:success] = "Created Successfully!"
      redirect_to hospitals_patients_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      if params[:image].present?
        @patient.pictures.last.update_attributes({image: params[:image]})
        # @patient.pictures.build({image: params[:image]}).save
      end
      flash[:success] = "Updated Successfully!"
      redirect_to hospitals_patients_path
    else
      render :edit
    end
  end

  def destroy
    if @patient.destroy
      flash[:success] = "Deleted Successfully!"
    else
      flash[:error] = "Unable to Delete!"
    end
    redirect_to hospitals_patients_path
  end

  def patient
    @patient = Patient.find params[:id]
  end
    
  protected
    def patient_params
      params.require(:patient).permit(:name, :email, :address, :problem, :description)
    end
end
