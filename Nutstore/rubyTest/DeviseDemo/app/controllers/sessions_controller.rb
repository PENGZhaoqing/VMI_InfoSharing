class SessionsController < ApplicationController
  # skip_before_filter :set_current_user
  
  def create
    auth=request.env["omniauth.auth"]
    user= Moviegoer.find_by_provider_and_uid(auth["provider"],auth["uid"])|| Moviegoer.create_with_omniauth(auth)
    session[:user_id]=user.id
    flash[:notcie]="Login Successfully"
    redirect_to movies_path
  end
  
  
  def destroy
    session.delete(:user_id)
    flash[:notice]='Logged out successfully'
    redirect_to movies_path 
  end 
  
  def failure
    flash[:notice]='Login failure,please try it again' 
    redirect_to movies_path 
  end

  
end
