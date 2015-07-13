class SnmmauryaMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'desktop_plateform/users/mailer' # to make sure that your mailer uses the devise views

  def confirmation_instructions(record, token, opts={})
    
  end

  def reset_password_instructions(record, token, opts={})
    super
  end
  
  def unlock_instructions(record, token, opts={})
    super
  end 
end