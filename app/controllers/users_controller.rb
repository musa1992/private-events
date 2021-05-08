class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:notice] = "Welcome to EventSter"
      redirect_to events_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.attended_event.all
    @created_events = @user.events
  end

  def inbox
    @messages = current_user.invitations.all
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
