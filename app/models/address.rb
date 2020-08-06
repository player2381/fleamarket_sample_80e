class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :address_first_name, :address_family_name, :address_first_name_kana, :address_family_name_kana, :post_code, :prefecture_code, :city, :house_number, :building_name, :phone_number, :user_id, presence: true
end
