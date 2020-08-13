class Production < ApplicationRecord

  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end
