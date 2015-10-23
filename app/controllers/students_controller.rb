class StudentsController < ApplicationController
	def new
		@student = Student.new()
	end

	def create
		@student = Student.new(params.require(:newstudent).permit(:firstname, :lastname, :sid, :new_password, :new_password_confirmation))
		@student.enrollment = "Enrolled"
  	if @student.save
      redirect_to home_manage_path
  	else
    	render 'new'
  	end
	end
end
