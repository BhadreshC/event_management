class BudgetList < ApplicationRecord
  has_many :activities, as: :activeable
  belongs_to :user
  belongs_to :event
  validates :title, :amount, presence: true

  #set_budegt_activities
  def set_activity(user_name, old_amount = '', old_title = '')
    if !old_amount.blank? && old_amount != self.amount
      self.activities.create(name: "Amount changed #{old_amount} to #{self.amount} by #{user_name} at #{DateTime.now.utc}")
    end
    if !old_title.blank? && old_title != self.title
      self.activities.create(name: "Title changed #{old_title} to #{self.title} by #{user_name} at #{DateTime.now.utc}")
    end
  end
end
