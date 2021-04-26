class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid user name'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
