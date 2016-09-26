require "securerandom"

class User < ActiveRecord::Base
  
  def create_user!(param_hash)
    if params_hash[:user_id].empty? or params_hash[:email].empty?
      flash[:warning] = "All fields must be filled out"
      redirect_to new_user_path
    else
      if User.find_by(user_id: params_hash[:user_id]) == nil
        @user = super.create!(param_hash)
        flash[:notice] = "Welcome #{@user.user_id}. Your accout has been created"
        redirect_to users_path
      else
        flash[:notice] = "Sorry, that user-id already exists"
        redirect_to new_user_path
      end
    end
  end
  
end