class Hospitals::AppointmentsController < ApplicationController
  before_action :appointment, except: [:new, :create, :index]
  # authorize_resource

  def index
    @appointments = Appointment.all
    if params[:download].present?
      Download.initialize_background_download({filename: "Appointment-#{Time.new.strftime("%m%d%Y%H%M%S")}", extension: "xls", title: :Appointment, user: current_user, params: params})
      redirect_to downloads_path and return
    end
  end

  def show
  end
  
  def new
    @appointment = Appointment.new
    #authorize! :show, @project
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.appointment_created_at = Time.new
    if @appointment.save
      flash[:success] = "Created Successfully!"
      redirect_to hospitals_appointments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      flash[:success] = "Updated Successfully!"
      redirect_to hospitals_appointments_path
    else
      render :edit
    end
  end

  def destroy
    if @appointment.destroy
      flash[:success] = "Deleted Successfully!"
    else
      flash[:error] = "Unable to Delete!"
    end
    redirect_to hospitals_appointments_path
  end

  def appointment
    @appointment = Appointment.find params[:id]
  end
    
  protected
    def appointment_params
      params.require(:appointment).permit(:doctor_id, :patient_id, :appointment_at)
    end
end
