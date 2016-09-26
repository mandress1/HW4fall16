class SessionsController < ApplicationController
  
  def session_params
    params.require(:user).permit(:user_id, :email)  
  end
  
  def create
    params = session_params
    usr = User.find_by(user_id: params[:user_id])
    
    if not usr.nil?
      if usr.email == params[:email]
        session[:session_token] = usr.session_token
        redirect_to movies_path
      else
        flash[:warning] = "Invalid user-id/e-mail combination"
        redirect_to login_path
      end
    else
      flash[:warning] = "Invalid user-id/e-mail combination"
      redirect_to login_path
    end
  end
  
  def destroy
    session[:session_token] = nil
    redirect_to movies_path
  end
  
end
