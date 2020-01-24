class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      log_in @user
      redirect_to events_path
    else
      flash.now[:danger] = 'username not found'
      render 'new'
    end    
  end

  def destroy
    log_out @user if logged_in?
    redirect_to root_path
  end
end
