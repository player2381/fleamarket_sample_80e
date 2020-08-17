class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :card
  belongs_to :production
end
