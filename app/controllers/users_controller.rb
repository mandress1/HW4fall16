class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:user_id, :email)  
  end
  
  def new
    
  end
  
  def create
    # do i need to make sure the email is in the correct format?
    new_params = user_params
    if new_params[:user_id].empty? or new_params[:email].empty?
      flash[:warning] = "All fields must be filled out"
      redirect_to new_user_path
    else
      if User.find_by(user_id: new_params[:user_id]).nil?
        @user = User.create_user!(new_params)
        flash[:notice] = "Welcome #{@user.user_id}. Your accout has been created"
        redirect_to login_path
      else
        flash[:notice] = "Sorry, that user-id already exists"
        redirect_to new_user_path
      end
    end
  end
  
  def index
    @users = User.all
  end
  
end
