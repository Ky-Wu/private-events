class UsersController < ApplicationController
  include ApplicationHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user.id)
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
    @upcoming_events = @user.attended_events.upcoming
    @prev_events = @user.attended_events.past
  end

  private

    def user_params
      params.require(:user).permit(:name,:email,:password)
    end
end
