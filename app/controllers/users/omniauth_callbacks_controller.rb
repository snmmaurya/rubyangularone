class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :new_user?, only: [:facebook, :google_oauth2]
  before_action :check_email, only: :facebook
  before_action :store_origin, except: [:google_oauth2, :facebook]

  include Authentication
  
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      if @user.confirmed?
        next_action_of_user
      else
        flash[:error] = "We've sent you an account confirmation email at your Id #{@user.email}. #{ApplicationController.helpers.link_to "Change email Id", user_edit_email_path(AESCrypt.encrypt(@user.uid, "authentication")), remote: true, onclick: "javascript: return false;", class: "edit_email"} or #{ApplicationController.helpers.link_to "Resend confirmation email", "/users/confirmation/new"}"
        redirect_to request.env['omniauth.origin'] || new_user_session_path
      end
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to_omniauth_origin
    end
  end

  def twitter
    # render :text => "<pre>" + env["omniauth.auth"].to_yaml and return
    @user = User.from_twitter_omniauth(request.env["omniauth.auth"])    
    if @user.persisted?
      next_action_of_user
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to_omniauth_origin
    end
  end

  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      next_action_of_user
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to_omniauth_origin
    end
  end

  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    # render :text => "<pre>" + env["omniauth.auth"].to_yaml and return
    if @user.persisted?
      next_action_of_user
    else
      session["devise.github_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to_omniauth_origin
    end
  end

  def check_email
    if @new_user && request.env["omniauth.auth"]["info"]["email"].blank?
      flash[:error] = "Please provide your email Id to complete the registration."
      redirect_to new_user_registration_path(request.env["omniauth.auth"])
    end
  end

  def failure
    flash.keep[:error] = "Authentication failed!"
    redirect_to request.env['omniauth.origin'] || new_user_registration_path
  end

  def redirect_to_omniauth_origin
    error_if_any
    redirect_to request.env['omniauth.origin'] || new_user_registration_path
  end

  def error_if_any
    flash[:error] = @user.errors.full_messages[0] if @user.errors.any?
  end

  def next_action_of_user
    sign_in(@user)
    if @new_user
      flash[:referer]=true
      redirect_to (thank_you_path(auth: true, provider: ((request.env["omniauth.auth"]["provider"]=="facebook") ? "Facebook" : "Google")))
    else
      flash[:notice] = "Signed in successfully."
      goto_origin(profile_user_path(@user.username))
    end
  end

  def new_user?
    @new_user = User.omniauth_new_user?(request.env["omniauth.auth"])
  end
end