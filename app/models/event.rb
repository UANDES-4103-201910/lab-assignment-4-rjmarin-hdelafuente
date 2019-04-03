require 'date'
class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types
  validates :start_date, presence: true
  validate :ensure_correct_day, on: :create
  private
  def ensure_correct_day
    if self.start_date >= Date.today
      events = Event.where(event_venue_id: self.event_venue_id)
      for ev in events do
          if ev.start_date == self.start_date
              errors.add(:start_date,"is not posible to create an event on the same event venue on that day")
              return false
          end
      end
      return true
    end
    errors.add(:start_date,"is not posible to create an event on that day")
    return false
  end
end

