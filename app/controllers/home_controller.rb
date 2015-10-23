class HomeController < ApplicationController
  def index
  end

  def login 
    if session[:current_user_id] != nil
      redirect_to home_dashboard_path
    end
  	@user = User.new()
    flash[:notice] = ["Message 1"]
  end

  def authenticate
  	@user = User.find_by(email: params[:login][:email])
  	encryptedPassword = Digest::SHA2.hexdigest(params[:login][:password])
    if  encryptedPassword == @user.password
      session[:current_user_id] = @user.id
      redirect_to home_dashboard_path
  	else
    	render 'login'
    end
  end

  def logout
  	session.delete(:current_user_id)
  	redirect_to root_url
  end

  def dashboard
    if session[:current_user_id] == nil
      redirect_to root_url
    end
  end

  def manage
    if session[:current_user_id] == nil
      redirect_to root_url
    end

    @teachers = Teacher.all
  end
end
