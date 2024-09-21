class LoginController < ApplicationController


  def login
    @user = User.new
  end 
  

    def check_login
      @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password]) 
        puts "login success"
        session[:user_id] = @user.id
        redirect_to lists_path
      else
        flash[:notice] = "forkert brugernavn eller adgangskode"   
        render :login
      end
    end

    def create
      @user = User.new
    end

    def new
      @user = User.new(user_params)
      if @user.save
        redirect_to :login
      else
        flash[:notice] = @user.errors.full_messages.to_sentence
        render :create
      end
    end



    private

    def user_params
        params.require(:user).permit(:email, :password, :username, :password_confirmation)
    end
    
    
end
