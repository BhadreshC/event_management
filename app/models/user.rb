class User < ApplicationRecord
  enum role: [:admin, :member]
  has_and_belongs_to_many :events
  has_many :expenses
  has_many :budget_lists
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :trackable
  validates :number, presence:true, uniqueness: true, length: {minimum: 10, maximum: 10, too_short: 'should be 10 digits ', too_long: 'should be 10 digits '}
  validates_uniqueness_of :number, :email
  validates_format_of :number, with:  /[2-9]{2}\d{8}/,  message: "Only positive number without spaces are allowed"
end
