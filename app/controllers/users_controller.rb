class UsersController < ApplicationController

	def index
    @users = User.all
 	end

	def new
		@user = User.new()
	end

	def create
	# TO DO: validate input. Make sure email and password are not blank, and make sure password and verified password match.
  	# TO DO: bonus -  make sure email address is properly structured.
		
    @user = User.new(params.require(:newuser).permit(:email, :new_password, :new_password_confirmation))
    
  	if @user.save
      redirect_to @user
  	else
    	render 'new'
  	end
	end

	def show
		@user = User.find(params[:id])
	end

end
