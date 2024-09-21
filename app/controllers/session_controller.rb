class SessionController < ApplicationController
    before_action :check_for_session_id
    def check_for_session_id
        if session[:user_id].present?
            
        else
            redirect_to :login
        end
    end
end