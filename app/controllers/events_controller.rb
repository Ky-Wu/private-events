class EventsController < ApplicationController
  include ApplicationHelper
  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @invite = EventAttending.new
  end

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  private

    def event_params
      params.require(:event).permit(:title, :date, :location, :description)
    end
end
