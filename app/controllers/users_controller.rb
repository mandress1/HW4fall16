class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:user_id, :email)  
  end
  
  def new
  end
  
  def create
    @user = User.create!(user_params)
    flash[:notice] = "#{@user.user_id} was created"
    redirect_to list_users_path
  end
  
end
