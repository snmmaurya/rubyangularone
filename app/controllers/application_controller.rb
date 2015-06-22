class ApplicationController < ActionController::Base
  # rescue_from ::ActiveRecord::RecordNotFound, with: :rescue_exception
  # rescue_from ::NameError, with: :rescue_exception
  # rescue_from ::ActionController::RoutingError, with: :rescue_exception
  # rescue_from ::Exception, with: :rescue_exception

  respond_to :html, :js, :json, :xml, :pdf
  protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session
  before_action :plateform
	before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_origin, unless: :devise_controller?
  layout (self.class.parent=="Administrator") ? "administrator" : "application"

  include ApplicationHelper
  include Authentication
  include GeneratePdf

	rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end



  def after_sign_in_path_for resource
    session[:origin] || profile_user_path(resource)
  end  
#------------------- Changing views depend on plateform --------------------#
# Paramter: ?plateform=MOBILE | plateform=WEB | plateform=IPAD
  def plateform
    session[:plateform] = params[:plateform] if params[:plateform]
    if ["MOBILE", "IPAD", "DESKTOP"].include?(plateform?)
      prepend_view_path Rails.root + "app" + "#{(plateform?).downcase}_plateform"
    else
      prepend_view_path Rails.root + "app" + "desktop_plateform"
    end
  end

  def plateform?
    if ["MOBILE", "IPAD", "DESKTOP"].include?(session[:plateform])
     session[:plateform] = (request.user_agent =~ /Mobile|webOS|Opera Mini/) ? "MOBILE" : ((request.user_agent !~ /iPad/) ? "IPAD" : "DESKTOP")
    end
  end
#------------------- Changing views depend on plateform --------------------#

	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :username, :email, :password, :password_confirmation, :uid, :provider, :remote_image_url, infos_attributes: [:fname, :lname]) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
	end

	def user
		@this_user = User.find params[:id]
	end

  def rescue_exception exception
    # render json: {error: exception.message}.to_json, status: 404
    @message = exception.message; render :template => "/errors/rescue_exception", :status => 404
  end 

  protected :configure_permitted_parameters, :user
  private :rescue_exception
end