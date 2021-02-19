class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :expenses, dependent: :destroy
  has_many :budget_lists, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  belongs_to :event_category
  validates :title, :venue, :start_date, :end_date, :time_to_start, :person_capicity, :event_type, presence: true
  enum event_type: [:public_event, :private_event]

  def current?(event)
    (event.start_date .. event.end_date).include?(Date.today)
  end
end
