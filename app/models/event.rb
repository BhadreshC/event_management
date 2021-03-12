class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :expenses, dependent: :destroy
  has_many :budget_lists, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_rich_text :about
  belongs_to :event_category
  validates :title, :about, :venue, :start_date, :end_date, :time_to_start, :event_type, presence: true
  validate :end_date_is_after_start_date

  enum event_type: ["Public", "Private"]

  def current?(event)
    (event.start_date .. event.end_date).include?(Date.today)
  end

  private
  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date <= start_date
      errors.add(:end_date, "must be or equal to greater than start date")
    end
  end
end
