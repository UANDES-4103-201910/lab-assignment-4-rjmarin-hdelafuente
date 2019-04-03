class TicketType < ApplicationRecord
  belongs_to :event
  belongs_to :ticket_zone
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0,
                                                    message: "invalid price"}

end
