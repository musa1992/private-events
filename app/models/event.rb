class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
    has_many :invitations
    has_many :attendees, through: :invitations, source: :user

    validates :event_date, :title, :description, :venue, presence: true

    def confirmed_attendees(event_id)
        @event = Event.find(event_id)
        confirmed_guests = []
        @event.attendees.each do |attendee|
           invite = Invitation.where("user_id = ? AND event_id = ?", attendee.id, @event.id).first
           confirmed_guests << attendee if invite.status == "accepted"
        end
        confirmed_guests
    end

    def users_without_invites(event_id)
        event = Event.find(event_id)
        no_invites = User.all.to_a - event.attendees.to_a
        no_invites - [event.creator]
    end
end
