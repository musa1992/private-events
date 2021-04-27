class EventsController < ApplicationController
    def index

    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            flash[:success] = "Event successfully created"
            redirect_to @event
        else
            render 'new'
        end
    end

    def show
        @event = Event.find(params[:id])
        @guests = User.all
    end

    private

      def event_params
        params.require(:event).permit(:event_date)
      end

end
