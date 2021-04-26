class User < ApplicationRecord
    has_many :events
    has_many :attended_event, class_name: 'Event', through: :invitations
end
