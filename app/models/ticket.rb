class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order
  before_save :check_creation_date
  before_save :check_bought_date

  private
    def check_creation_date
      this_thicket_type = TicketType.where(id: ticket_type_id)
      event = Event.where(id: this_thicket_type.event_id)

      if event.start_date < Date.today
        errors.add(:start_date, "can't create ticket after the event starting date!")
        return false
      else
        return true
      end
    end
    def check_bought_date

    end
end
