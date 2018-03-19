class SessionsController < ApplicationController
  def new
  end
  
def create
    begin 
    @user = User.find_by(name: params[:session][:name])
    if @user != nil && @user[:uin] == params[:session][:uin]&& @user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in (@user)
      redirect_to @user
    elsif !@user.authenticate(params[:session][:password]) && @user[:uin] == params[:session][:uin]
      flash.now[:danger] = 'Wrong Password Only !'
      render 'new'
    elsif @user.authenticate(params[:session][:password]) && @user[:uin] != params[:session][:uin]
      # Create an error message.
      flash.now[:danger] = 'Wrong UIN Only !' # Not quite right!
      render 'new'
    else
      flash.now[:danger] = 'Wrong UIN and Wrong Password !' # Not quite right!
      render 'new'
    end
    rescue
    flash.now[:danger]='Invalid Name !'
    render 'new'
  end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
    # Logs in the given user.
    
    
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  

  
  
end
