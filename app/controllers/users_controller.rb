class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:user_id, :email)  
  end
  
  def new
    
  end
  
  def create
    if params[:user][:user_id].empty? or params[:user][:email].empty?
      flash[:warning] = "All fields must be filled out"
      redirect_to new_user_path
    else
      if User.find_by(user_id: params[:user][:user_id]) == nil
        @user = User.create!(user_params)
        flash[:notice] = "#{@user.user_id} was created"
        redirect_to users_path
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
