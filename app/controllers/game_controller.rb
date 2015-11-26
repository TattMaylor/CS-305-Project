class GameController < ApplicationController

	def login
    session.delete(:current_teacher_id)
		if session[:current_student_id] != nil
     	 redirect_to game_login_path
   		 end

   		 @student = Student.new()
	end

	def authenticate
  	 @student = Student.find_by(sid: params[:login][:sid])
  	 encryptedPassword = Digest::SHA2.hexdigest(params[:login][:password])
        if encryptedPassword == @student.password
          session[:current_student_id] = @student.id
         redirect_to game_index_path
      	else
       	render 'login'
       end

  	end

    def index
      if session[:current_student_id] == nil
      redirect_to game_login_path
    end
    end

  	def logout
      session.delete(:current_student_id)
      redirect_to game_login_path
    end
end
