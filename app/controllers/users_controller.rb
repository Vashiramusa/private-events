# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User created!'
    else
      render 'new'
    end        
  end  

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end
  
end
