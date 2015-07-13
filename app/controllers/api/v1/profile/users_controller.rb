class Api::V1::Profile::UsersController < Api::V1::BaseApiController
  before_action :user
  # authorize_resource
  def show
    @authenticated_user = (current_user && current_user == @this_user) ? current_user : @this_user
    @user_infos = User.joins(:infos).where("users.id=?",@authenticated_user.id)
    @response = @user_infos.first.attributes.merge(@user_infos.first.infos.first.attributes)
    @response[:image] = @authenticated_user.image_url
    render json: @response
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(user_params)
      flash[:notice] = "Your Profile Informations Updated Successfully"
      redirect_to edit_profile_user_path @user
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:image, :resume_doc, :resume_pdf, infos_attributes: [ :fname, :lname, :contact, :address, :gender, :about_yourself, :martial_status, :_destroy])
  end
end
