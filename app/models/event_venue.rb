class EventVenue < ApplicationRecord
  validates :name, presence: true, length: {minimum: 20, message: "invalid name! almost 20 character"}
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0,
                                                       message: "invalid capacity" }
end
