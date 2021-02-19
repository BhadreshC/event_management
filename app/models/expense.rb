class Expense < ApplicationRecord
  has_many :activities, as: :activeable, dependent: :destroy
  belongs_to :user
  belongs_to :event
  validates :description, :date, :amount, presence: true

  #set_budegt_activities
  def set_activity(user_name, old_description= '', old_date= '', old_amount = '')
    if !old_amount.blank? && old_amount != self.amount
      self.activities.create(name: "Amount change  #{old_amount} to #{self.amount} by #{user_name} at #{DateTime.now.utc}")
    end
    if !old_description.blank? && old_description != self.description
      self.activities.create(name: "Description change #{old_description} to #{self.description}  by #{user_name} at #{DateTime.now.utc}")
    end
    if !old_date.blank? && old_date != self.date
      self.activities.create(name: "Date change  #{old_date} to #{self.date} by #{user_name} at #{DateTime.now.utc}")
    end
  end
end
