class InvitationsController < ApplicationController
    def create
        invited_guests = params[:guest]
        event_id = params[:event_id]
        
        invited_guests.each do |guest|
            msg = "Dear #{User.find(guest).username}, u have been invited to the party"
            Invitation.create(user_id: guest, event_id: event_id, message: msg)
        end
        redirect_to events_path
    end
end
