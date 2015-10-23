class TeachersController < ApplicationController

	def new
		if session[:current_user_id] == nil
      		redirect_to root_url
   		end
		@teacher = Teacher.new()
	end

	def create

    @teacher = Teacher.new(params.require(:newteacher).permit(:firstname, :lastname, :email, :new_password, :new_password_confirmation, :super_box))
    
    if :super_box == 1
    	@teacher.super = true;
    else
      @teacher.super = false;
    end

  	if @teacher.save
      redirect_to home_manage_path
  	else
    	render 'new'
  	end
	end
end
