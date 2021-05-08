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
    @user_upcoming_events = @created_events.upcoming_events
    @upcoming_invited = @user.attended_event.upcoming_events
    @attended_events = @user.attended_event.past_events
  end

  def inbox
    @messages = current_user.invitations.all
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
