class HomeController < ApplicationController
  def index
  end

  def login 
  	@user = User.new()
  end

  def authenticate
  	@user = User.find_by(email: params[:login][:email])
  	encryptedPassword = Digest::SHA2.hexdigest(params[:login][:password])
    if  encryptedPassword == @user.password
      session[:current_user_id] = @user.id
      redirect_to root_url
  	else
    	render 'login'
    end
  end

  def logout
  	session.delete(:current_user_id)
  	redirect_to root_url
  end
end
