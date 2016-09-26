class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:user_id, :email)  
  end
  
  def new
    
  end
  
  def create
    if User.find_by(user_id: params[:user][:user_id]) == nil
      @user = User.create!(user_params)
      flash[:notice] = "#{@user.user_id} was created"
      redirect_to users_path
    else
      flash[:notice] = "#{params[:user_id]} already exists"
      redirect_to users_path
    end
  end
  
  def index
    @users = User.all
  end
  
end
