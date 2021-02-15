class Expense < ApplicationRecord
  # belongs_to :user
  has_many :users
end
