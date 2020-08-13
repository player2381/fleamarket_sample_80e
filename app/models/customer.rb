class Customer < ApplicationRecord
  belongs_to :user

  #validates :user_id , presence: true
  # validates :nickname , presence: true, uniqness: true, length: {maximun: 10}
end
