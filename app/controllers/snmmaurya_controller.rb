class SnmmauryaController < ApplicationController
	after_action :flash_message, only: :thank_you
	after_action :store_origin, unless: :thank_you
	before_action :snmmaurya, only: [:index, :download_resume]
	
	def index
	end

	def solutions
	end

	def downloads
		@downloads =  Kaminari.paginate_array(Download.order(created_at: :desc)).page(params[:page]).per(params[:per_page] || 10)
	end	

	def portfolios
		@portfolios = Portfolio.all
	end

	def portfolio
		@portfolio = Portfolio.find params[:id]
	end

	def show
	end

	def contact
		@contact = Contact.new
	end

	def create_contact
		respond_to do |format|
			format.js
			@contact = Contact.new(contact_params)
			@contact.save
		end	
	end

	def about
		@user = User.find_by(role_id: 1)
		@employments = @user.employments
		@educations = @user.educations
		@developments = @user.developments
		@technologies = @user.technologies
		@apis = @user.apis
		@profile = nil #Profile.first
	end

	def errors
		#When Any Error Comes
		@users = User.where(status: :ACTIVE).first
  end

	def thank_you
		# if request.referer.present?
  #     referer = request.referer.split("/").last.split("?").first
  #     if ["sign_up", "users", "sign_in"].exclude?(referer)
  #       redirect_to errors_path and return
  #     else
  #       if params[:auth].present? && flash[:referer].blank?
  #         redirect_to errors_path and return
  #       end
  #     end
  #   else
  #     redirect_to errors_path and return unless params[:auth].present? && flash[:referer].present?
  #   end
	end
	
	def flash_message
		flash[:notice] = "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
	end

	def snmmaurya
		@snmmaurya = User.includes(:infos).joins(:infos).where(role_id: 1).first
	end	

	def download_resume
		if request.format.pdf?
			send_file "#{Rails.root}/public#{@snmmaurya.resume_pdf_url}", :type => 'application/pdf', :disposition => 'attachment' #inline
		else
			send_file "#{Rails.root}/public#{@snmmaurya.resume_doc_url}", :type => 'application/doc', :disposition => 'attachment'
		end	
	end

	protected
		def contact_params
			params.require(:contact).permit(:name, :email, :contact, :message)
		end	
end