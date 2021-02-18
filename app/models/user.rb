class User < ApplicationRecord
  enum role: [:admin, :member]
  has_and_belongs_to_many :events
  has_many :expenses
  has_many :budget_lists
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :trackable
  validates_format_of :number, with:  /\d[0-9]\)*\z/ , message: "Only positive number without spaces are allowed"
end
