class User < ApplicationRecord
    has_many :events
    has_many :invitations
    has_many :attended_event, through: :invitations, source: :event
    validates :username, presence: true
    
    # def self.users_without_invites(event_id)
    #     users_no_invite = []
    #     @users = User.all
    #     # invites = Invitation.where('event_id = ?', event_id).to_a
    #     @user.each do |user|
    #         users_no_invite << user if user.attended_event.find_by(id: event_id).empty?
    #     end
    #     users_no_invite
    # end

end
