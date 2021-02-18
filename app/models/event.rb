class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :expenses, dependent: :destroy
  has_many :budget_lists, dependent: :destroy
  validates :title, :venue, :start_date, :end_date, presence: true
end
