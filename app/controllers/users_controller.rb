class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:user_id, :email)  
  end
  
  def new
    
  end
  
  def create
    User.create_user!(user_params()[:user])
  end
  
  def index
    @users = User.all
  end
  
end
