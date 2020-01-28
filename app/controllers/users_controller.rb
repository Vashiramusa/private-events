class UsersController < ApplicationController
  before_action :user_logged_in?, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @past_created_events = @user.created_events.past
    @upcoming_created_events = @user.created_events.future
    @past_attended_events = @user.attending_events.past
    @future_attending_events = @user.attending_events.future
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end
end
