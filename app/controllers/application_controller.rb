class ApplicationController < ActionController::Base
  include SessionsHelper

  def user_logged_in?
    return if logged_in?
    
    flash[:danger] = 'You must be logged in to perform that action'
    redirect_to :login
  end 
end
