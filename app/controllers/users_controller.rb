class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to EventSter"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.attended_event.all
    @created_events = @user.events
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
