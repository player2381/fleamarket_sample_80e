class Customer < ApplicationRecord
  belongs_to :user
  # belongs_to :card

  validates :user_id
end
