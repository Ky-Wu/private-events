class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendings
  has_many :attendees, through: :event_attendings, source: :user
  scope :past,   -> { where('date < ?', Time.now) }
  scope :upcoming, -> { where('date > ?', Time.now).order(date: :asc) }
end
