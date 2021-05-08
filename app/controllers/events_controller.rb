class EventsController < ApplicationController
    before_action :require_login, only: [:new]
    def index
        @upcoming_events = Event.upcoming_events
        @past_events = Event.past_events
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            flash[:notice] = "Event successfully created"
            redirect_to @event
        else
            render 'new'
        end
    end

    def show
        @event = Event.find(params[:id])
        @guests = @event.users_without_invites(params[:id])
        @confirmed_guests = @event.confirmed_attendees(@event.id)
    end

    private

      def event_params
        params.require(:event).permit(:event_date,:title,:venue,:description)
      end

end
