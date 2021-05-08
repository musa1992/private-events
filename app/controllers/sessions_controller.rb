class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user
      log_in user
      flash[:notice] = "You successfully signed in"
      redirect_to events_path 
    else
      flash.now[:error] = "Enter correct username / Sign up if you do not have an account"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
