class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern


  def check_login
    if session[:user_id].present?
        
    else
        redirect_to :login
    end
end
end
