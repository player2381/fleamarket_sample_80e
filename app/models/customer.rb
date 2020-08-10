class Customer < ApplicationRecord
  belongs_to :user
  # belongs_to :card

  #validates :user_id , presence: true
  # validates :nickname , presence: true, uniqness: true, length: {maximun: 10}
end
