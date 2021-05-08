class User < ApplicationRecord
    has_many :events
    has_many :invitations
    has_many :attended_event, through: :invitations, source: :event
    validates :username, presence: true
    
    
    def has_invite(event)
        attended_event.to_a.include?(event)
    end
end
