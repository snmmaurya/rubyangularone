class Api::V1::SnmmauryaController < Api::V1::BaseApiController
  before_action :snmmaurya, only: [:home, :download_resume]
  def get_current_user
    render json: current_user
  end

  def home
    @info = @snmmaurya.infos.first
    @response = @snmmaurya.attributes.merge(@info.attributes)
    @response[:image_url] = @snmmaurya.image_url
    render json: @response
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

  def footer_solutions
    @solutions = Solution.all
    render json: @solutions
  end  

  def about
    @user = User.find_by(role_id: 1)
    @employments = @user.employments
    @educations = @user.educations
    @developments = @user.developments
    @technologies = @user.technologies
    @apis = @user.apis
    @profile = nil #Profile.first
    @response = {user: @user, employments: @employments, educations: @educations, developments: @developments, technologies: @technologies, apis: @apis, profile: @profile}
    render json: @response
  end
end