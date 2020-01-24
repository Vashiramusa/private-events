class EventsController < ApplicationController
  before_action :this_event, only: %i[join show]

  def new
    @event = Event.new
  end
  
  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = 'Event created successfully!'
      redirect_to @event
    else
      render 'new'
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def index
    @future = Event.future
    @past = Event.past
  end

  def join
    if current_user.join_event(@event)
      flash[:success] = "You're now attending this event"
    else
      flash[:danger] = "You're already attending this event!"
    end
    redirect_to @event
  end

  private

    def this_event
      @event = Event.find_by(id: params[:id])
      return if @event

      flash[:warning] = "The event doesn't exist"
      redirect_to :root
    end

    def event_params
      params.require(:event).permit(:title, :description, :date)
    end   

end
