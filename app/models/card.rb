class Card < ApplicationRecord
  belongs_to :user
  # belongs_to :customerユーザーに紐づけられてるのでいらない？？
end
