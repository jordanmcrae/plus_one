class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @event_review = @event.event_reviews.build
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    # @event.user_id = current_user.id

    if @event.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(project_params)
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end


  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_url
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :address_1, :address_2, :city, :country, :z_post_code, :latitude, :longitude, :number_of_attendees, :time, :description, :cost, :image, :category)
  end

end
