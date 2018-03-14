class InvitesController < ApplicationController
  include ApplicationHelper
  before_action :correct_user

  def create
    user = User.find_by(name: invite_params[:name])
    @invite = user.event_attendings.build(event_id: @event.id)
    if @invite.save
      redirect_to @event
    else
      render @event
    end
  end

  private

    def invite_params
      params.permit(:event_id, :name)
    end

    def correct_user
      @event = Event.find(invite_params[:event_id])
      redirect_to @event unless current_user == @event.creator
    end
end
