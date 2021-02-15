class User < ApplicationRecord
  has_and_belongs_to_many :events
  has_many :expenses
  # accepts_nested_attributes_for :expenses, reject_if: :all_blank, allow_destroy: true
  # has_many :users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :trackable
end
