class Activity < ApplicationRecord
  belongs_to :activeable, polymorphic: true
end
