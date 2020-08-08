class Card < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  validates :user_id, :customer_id, presence: true, uniqueness: true
end
