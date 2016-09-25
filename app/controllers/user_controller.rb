class UserController < ApplicationController
  def user_params
       params.require(:user).permit(:id, :email) 
    end
    
    def new
      # default new template
    end
    
    def create
      @user = User.create!(user_params)
      flash[:notice] = "#{@user.id} was created"
      redirect_to.movies_path
    end
end
