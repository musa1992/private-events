class InvitationsController < ApplicationController
    def create
        invited_guests = params[:guest]
        event_id = params[:event_id]
        
        invited_guests.each do |guest|
            @invited_guest = User.find(guest)
            msg = "Dear #{@invited_guest.username}, you have received an invitation to #{Event.find(event_id).title}"
            Invitation.create(user_id: guest, event_id: event_id, message: msg)
        end
        redirect_to events_path
    end

    def update
        @invitation = Invitation.find(params[:id])
        @invitation.update_column(:status, params[:status])
        if params[:status] == "accepted"
            redirect_to event_path(@invitation.event_id)
        else
            redirect_to events_path
        end
    end
end
