class EventsController < ApplicationController
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
  end
  
  def index
  end

  private

   def event_params
     params.require(:event).permit(:title, :description, :date)
   end   

end
