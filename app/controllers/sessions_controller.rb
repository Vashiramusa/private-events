class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username].downcase)
    if @user
      log_in @user
      flash.now[:success] = 'Welcome'
    else
      flash.now[:danger] = 'username not found'
      render 'new'
    end    
  end
end
