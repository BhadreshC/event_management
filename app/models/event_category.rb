class EventCategory < ApplicationRecord
  has_many :events
  enum status: [:active, :deactive]
end
