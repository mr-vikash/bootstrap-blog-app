class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "You have logged in successfully"
      session[:user_id] = user.id #for make user logged in untill he will not logout
      redirect_to user
    else
      flash[:alert] = "There was something wrong with your login details"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to root_path
  end
end