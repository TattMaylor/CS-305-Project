class HomeController < ApplicationController

  def index
  end

  def login 
    session.delete(:current_student_id)
    if session[:current_teacher_id] != nil
      redirect_to home_dashboard_path
    end
    	@user = User.new()
  end

  def authenticate
    if User.find_by(email: params[:login][:email]) != nil
  	 @user = User.find_by(email: params[:login][:email])
     encryptedPassword = Digest::SHA2.hexdigest(params[:login][:password])
        if  encryptedPassword == @user.password
          session[:current_teacher_id] = @user.id
         redirect_to home_dashboard_path
        else
        render 'login'
       end
    elsif Teacher.find_by(email: params[:login][:email]) != nil
      @user = Teacher.find_by(email: params[:login][:email])
      encryptedPassword = Digest::SHA2.hexdigest(params[:login][:password])
        if  encryptedPassword == @user.password
          session[:current_teacher_id] = @user.id
         redirect_to home_dashboard_path
        else
        render 'login'
       end
    else
      flash[:alert] = "Incorrect email or password."
      render 'login'
    end

  end

  def logout
  	session.delete(:current_teacher_id)
  	redirect_to root_url
  end

  def dashboard
    if session[:current_teacher_id] == nil
      redirect_to root_url
    end
  end

  def manage
    if session[:current_teacher_id] == nil
      redirect_to root_url
    end

    @teachers = Teacher.all
    @students = Student.all
  end

  def support
  end
end
