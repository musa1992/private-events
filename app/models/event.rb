class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
    has_many :invitations
    has_many :attendees, through: :invitations, source: :user

    validates :event_date, :title, :description, :venue, presence: true
end
