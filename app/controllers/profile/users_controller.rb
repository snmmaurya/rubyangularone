class Profile::UsersController < ApplicationController
	before_action :user
	# authorize_resource
	def show
		@user = (current_user && current_user == @this_user) ? current_user : @this_user
	end

	def edit
		@user = User.friendly.find(params[:id])
	end

	def update
		@user = User.friendly.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "Your Profile Informations Updated Successfully"
			redirect_to edit_profile_user_path @user
		else
			render :edit
		end
	end

	def user_params
		params.require(:user).permit(:email, :username, :password, :image, :resume_doc, :resume_pdf, infos_attributes: [:id, :fname, :lname, :contact, :address, :gender, :about_yourself, :martial_status])
	end
end
