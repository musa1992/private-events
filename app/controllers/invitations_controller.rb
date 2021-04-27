class InvitationsController < ApplicationController
    def create
        invited_guests = params[:guest]
        event_id = params[:event_id]
        invited_guests.each do |guest|
            Invitation.create(user_id: guest, event_id: event_id)
        end
        redirect_to events_path
    end
end
