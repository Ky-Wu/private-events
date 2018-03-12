class SessionsController < ApplicationController
  include ApplicationHelper
  def new
  end

  def create
    session[:user_id] = params[:user_id]
    redirect_to current_user
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
